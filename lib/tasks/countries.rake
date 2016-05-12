namespace :countries do

  desc "Test Countries"
  task :test => :environment do
    Legacy::Country.find_each do |t|
      tabledata = "<table>";
      Legacy::Country.columns.map(&:name).each do |x|
        tabledata = tabledata + "<tr><td>" + x.to_s + "</td><td>" + t[x].to_s + "</td></tr>";
      end
      tabledata = tabledata + "</table>";
    end

    puts "Made 2 cups of coffee. Shakes are gone."
  end

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

  desc 'Import Countries into terms'
  task :import => :environment do

    #Generic description for import items
    description = ""

    #Get theme ID
    master_theme = Refinery::Terms::Theme.where(title: 'Countries').first
    #Get all the letters
    letters = Refinery::Terms::Letter.where(theme_id: master_theme.id)

    Legacy::Country.find_each do |t|
      tabledata = "<table style='width:100%'>";
      Legacy::Country.columns.map(&:name).each do |x|
        if x.to_s != 'id'
          tabledata = tabledata + "<tr><td>" + x.to_s + "</td><td>" + t[x].to_s + "</td></tr>";
        end
      end
      tabledata = tabledata + "</table>";


      #Get Letter IDs
      letter_id = 0;
      letters.each do |l|
        if(t.Name[0,1].casecmp(l.letter) == 0)
          letter_id = l.id
          break
        end
      end

      #insert the term row
      term = Refinery::Terms::Term.create!(
          {
              title: t.Name,
              definition: description,
              master_id: master_theme.id
          }, without_protection: true
      )

      #Add the table to a section
      Refinery::Terms::Section.create!(
        {
          term_id: term.id,
          title: t.Name,
          body: tabledata,
          position: 0
        }, without_protection: true
      )

      #Add terms to letter linking row
      Refinery::Terms::LetterTerm.create!(
        {
          letter_id: letter_id,
          term_id: term.id
        }, without_protection: true
      )

      #Add term to theme
      Refinery::Terms::TermTheme.create!(
        {
          term_id: term.id,
          theme_id: master_theme.id,
          is_master: true
        }, without_protection: true
      )

    end

  end

end