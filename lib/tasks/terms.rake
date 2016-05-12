namespace :terms do

  desc 'Process imported content'
  task :process => :environment do
    processor = Processor.new
    Refinery::Terms::Term.find_each do |t|
      t.update_attribute(:definition, processor.process(t.definition))
      t.update_attribute(:description, processor.process(t.description))
      t.sections.each do |s|
        s.update_attribute(:body, processor.process(s.body))
      end
    end
  end

  desc 'Import legacy terms'
  task :import => :environment do

    Legacy::Term.find_each do |t|

      term = Refinery::Terms::Term.create!(
          {
              title: t.term,
              definition: t.definition.gsub(/p<>\./, ''),
              description: t.notes_on_definition.gsub(/p<>\./, ''),
              created_at: t.created_at,
              updated_at: t.updated_at
          }, without_protection: true
      )

      # Context converted into sections
      headings, bodies = t.context_as_array
      headings.each_with_index do |heading, index|
        body = bodies[index]
        body.gsub!(/p<>\./, '')

        term.sections << Refinery::Terms::Section.create!(
            {
                title: heading.downcase.titleize,
                body: body,
                position: (index + 1)
            }
        ) unless body.blank?
      end

      # References
      t.references_as_array.each do |reference|
        term.references << Refinery::Terms::Reference.create!(
            {
                title: reference,
                url: ''
            }
        )
      end

    end

  end

  desc 'Resave all terms to ensure acronyms set correctly'
  task :resave => :environment do
    Refinery::Terms::Term.find_each do |t|
      p t.id
      if t.master_theme_id
        if t.acronym.present?
          cached_acronym = t.acronym
          t.acronym = nil
          t.master_id = t.master_theme_id
          t.save!
          t.reload
          t.acronym = cached_acronym
          t.master_id = t.master_theme_id
          t.save!
        end
        cached_association_ids = t.association_ids
        cached_master_id = t.master_theme_id
        t.association_ids = []
        t.master_id = t.master_theme_id
        t.save!
        t.reload
        t.association_ids = cached_association_ids
        t.master_id = cached_master_id
        t.save!
      end
    end
  end

  desc 'Set letters'
  task :letters => :environment do
    Refinery::Terms::LetterTerm.find_each do |lt|
      if lt.term && lt.letter
        lt.destroy unless lt.term.association_ids.include?(lt.letter.theme.id)
        lt.destroy unless lt.term.title.first.upcase == lt.letter.letter
      else
        lt.destroy
      end
    end
  end

end