module Refinery
  module Terms
    describe Term do

      context 'validations' do

        it 'is invalid without a title' do
          build(:term, title:nil).should_not be_valid
        end

        it 'is invalid without a definition' do
          build(:term, definition:nil).should_not be_valid
        end

        it 'is invalid without a description' do
          build(:term, description:nil).should_not be_valid
        end

      end

      context 'sections relation' do
        it 'has a sections association' do
          build(:term).should respond_to(:sections)
        end
      end

      context 'associations relations' do

        before(:each) do
          @theme_0 = create(:theme)
          @theme_1 = create(:theme)
          @theme_2 = create(:theme)

          @theme_0.children << @theme_1
          @theme_1.children << @theme_2

          @term = create(:term)
          @term.associations << @theme_0
          @term.associations << @theme_1
          @term.associations << @theme_2
        end

        it 'has a themes association' do
          build(:term).should respond_to(:themes)
        end

        it 'returns stored themes' do
          @term.themes.should eq([@theme_0])
        end

        it 'has a categories association' do
          build(:term).should respond_to(:categories)
        end

        it 'returns categories' do
          @term.categories.should eq([@theme_1])
        end

        it 'has a subcategories association' do
          build(:term).should respond_to(:subcategories)
        end

        it 'returns subcategories' do
          @term.subcategories.should eq([@theme_2])
        end

        it 'has a master_theme association' do
          build(:term).should respond_to(:master_theme)
        end

      end

      context 'urls associations' do

        it 'has a links association' do
          build(:term).should respond_to(:links)
        end

        it 'has a tools association' do
          build(:term).should respond_to(:tools)
        end

        it 'has a references association' do
          build(:term).should respond_to(:references)
        end

      end

      context 'related terms' do

        it 'has a related_terms association' do
          build(:term).should respond_to(:related_terms)
        end

      end

      context 'acronyms' do

        it 'outputs title with acronym in brackets' do
          build(:term, title:'ABCDEF', acronym:'ABC').title.should eq('ABCDEF (ABC)')
          build(:term, title:'ABCDEF', acronym:nil).title.should eq('ABCDEF')
        end

        it 'has acronym_id attribute' do
          expect(build(:term).attributes).to include('acronym_id')
        end

        it 'has an child_term association' do
          build(:term).should respond_to(:child_term)
        end

        # TODO: Move this into a controller spec to access routes
        it 'sets defintions as link to parent term' do
          term = create(:term, title:'Important Bird Area', acronym:'IBA')
          term.child_term.definition.should == "<a href=\"/content/#{term.slug}'\">#{term.title}</a>"
        end

        it 'has the parents master theme as a theme' do
          theme = create(:theme)
          term = create(:term, title:'Important Bird Area', acronym:'IBA', master_id: theme.id)
          term.child_term.theme_ids.should include(theme.id)
        end

        it 'has the master_theme set to acronyms' do
          theme = create(:theme)
          term = create(:term, title:'Important Bird Area', acronym:'IBA', master_id:theme.id)
          term.child_term.reload.master_theme_id.should == Refinery::Terms::Theme.find_by_title('Acronyms').id
        end

        context 'acronym present - no child_term' do

          it 'creates a new child_term' do
            expect{
              create(:term, acronym:'ACR')
            }.to change(Term, :count).by(2)
          end

        end

        context 'acronym present - child_term exists' do

          it 'updates existing child_term' do
            term = create(:term, acronym:'POI')
            expect {
              term.update_attribute(:acronym, 'ACR')
            }.to change(Term, :count).by(0)
            term.child_term.reload.title.should == 'ACR'
          end

        end

        context 'no acronym - child_term exists' do

          it 'removes the existing child_term' do
            term = create(:term, acronym:'FGB')
            expect {
              term.update_attribute(:acronym, nil)
            }.to change(Term, :count).by(-1)
          end

        end

      end

    end
  end
end