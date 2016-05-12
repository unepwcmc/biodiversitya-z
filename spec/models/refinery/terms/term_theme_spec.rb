module Refinery
  module Terms
    describe TermTheme do

      context 'set letter' do

        it 'sets the letter and increments the count' do
          t1 = create(:theme)
          create(:term, title: 'Middle', association_ids: [t1.id])
          letter = t1.letters.find_by_letter('M')
          letter.letter_terms_count.should == 1
        end

        # Regression test for multiple associations with a letter
        it 'sets the letter and increments the count' do
          theme = create(:theme)
          term = create(:term, title: 'Middle', association_ids: [theme.id])
          term_theme = term.term_themes.first

          letter = theme.letters.find_by_letter('M')
          letter.letter_terms.count.should == 1
          letter.letter_terms_count.should == 1

          term_theme.save

          letter.letter_terms.reload.count.should == 1
          letter.reload.letter_terms_count.should == 1
        end

        context 'after_destroy' do

          it 'destroys the corresponding letter_term' do
            theme = create(:theme)
            term = create(:term, title: 'Middle', association_ids: [theme.id])
            term.letters.count.should == 1
            term.association_ids = []
            term.reload.letters.count.should == 0
          end

        end

      end
    end
  end
end