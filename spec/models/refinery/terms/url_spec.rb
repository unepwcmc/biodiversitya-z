module Refinery
  module Terms
    describe Url do

      context 'validations' do

        it 'is invalid without a title' do
          build(:url, title:nil).should_not be_valid
        end

        it 'is invalid without a url' do
          build(:url, url:nil).should_not be_valid
        end

      end

      context 'term association' do

        it 'has a term_id' do
          expect(build(:url).attributes).to include('term_id')
        end

        #it { should allow_mass_assignment_of(:term_id) }

        it 'responds to term' do
          build(:url).should respond_to(:term)
        end

      end

    end
  end
end