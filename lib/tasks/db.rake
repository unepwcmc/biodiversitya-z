namespace :db do

  desc 'Create dummy data for development'
  task :populate => :environment do

    # Enable database agnostic random ordering
    random = ActiveRecord::Base.connection.adapter_name.downcase.starts_with?('mysql') ? 'RAND()' : 'RANDOM()'

    # Themes
    %w(Areas Terms).each do |title|
      theme = Refinery::Terms::Theme.create!(
        {
          title:title,
          tagline:Faker::Lorem.sentence,
          description:Faker::Lorem.sentence,
          synopsis:title == 'Areas' ? 'Areas of Importance' : 'Key Terms'
        }
      )

      # Categories
      5.times do
        category = Refinery::Terms::Theme.create!(
          {
            title:Faker::Lorem.word,
            tagline:Faker::Lorem.sentence,
            description:Faker::Lorem.sentence,
            synopsis:Faker::Lorem.sentence,
            parent_id:theme.id
          }
        )

        # Subcategories
        5.times do
          Refinery::Terms::Theme.create!(
              {
                title:Faker::Lorem.word,
                tagline:Faker::Lorem.sentence,
                description:Faker::Lorem.sentence,
                synopsis:Faker::Lorem.sentence,
                parent_id:category.id
              }
          )
        end
      end
    end

    # Terms
    100.times do

      term = Refinery::Terms::Term.create!(
        {
          title:Faker::Lorem.word.titleize,
          definition:Faker::Lorem.paragraph,
          description:Faker::Lorem.paragraph
        }, without_protection: true
      )

      # Add associations

      subcategory = Refinery::Terms::Theme.subcategories.order(random).first
      term.term_themes << Refinery::Terms::TermTheme.new(theme_id: subcategory.id)
      term.term_themes << Refinery::Terms::TermTheme.new(theme_id: subcategory.parent.id)
      term.term_themes << Refinery::Terms::TermTheme.new(theme_id: subcategory.parent.parent.id, is_master: true)

      rand(12).times do
        term.sections << Refinery::Terms::Section.create!(
          {
            title: Faker::Lorem.words,
            body: Faker::Lorem.paragraph
          }
        )
      end

      rand(15).times do
        term.references << Refinery::Terms::Reference.create!(
          {
            title: Faker::Lorem.sentence,
            url: Faker::Internet.url
          }
        )
      end

      rand(8).times do
        term.links << Refinery::Terms::Link.create!(
          {
            title: Faker::Lorem.words,
            url: Faker::Internet.url
          }
        )
      end

      rand(8).times do
        term.tools << Refinery::Terms::Tool.create!(
          {
            title: Faker::Lorem.words,
            url: Faker::Internet.url
          }
        )
      end

      # Related terms
      limit = rand(5) + 2
      related_terms = Refinery::Terms::Term.order(random).limit(limit)
      related_terms.each do |rt|
        term.related_terms << rt
      end

    end

  end
end