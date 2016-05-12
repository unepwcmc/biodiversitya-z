module Refinery
  module Terms
    describe Theme do

      context 'validations' do

        it 'is invalid without a title' do
          build(:theme, title:nil).should_not be_valid
        end

        it 'is invalid without a tagline' do
          build(:theme, tagline:nil).should_not be_valid
        end

        it 'is invalid without a description' do
          build(:theme, description:nil).should_not be_valid
        end

        it 'is invalid without a synopsis' do
          build(:theme, synopsis:nil).should_not be_valid
        end

      end

      context 'attributes' do

        it 'has a tagline' do
          expect(build(:theme).attributes).to include("tagline")
        end

        it 'has a description' do
          expect(build(:theme).attributes).to include("description")
        end

        it 'has a synopsis' do
          expect(build(:theme).attributes).to include("synopsis")
        end

      end

      context 'images' do

        it 'has a logo' do
          build(:theme).should respond_to(:logo)
        end

        it 'has a banner image' do
          build(:theme).should respond_to(:banner)
        end

      end

      context 'themes relation' do

        it 'has a terms association' do
          build(:theme).should respond_to(:terms)
        end

        it 'returns stored terms' do
          theme = create(:theme)
          term = create(:term)
          theme.terms << term

          theme.reload.terms.should eq([term])
        end

      end

      context 'after create' do

        it 'creates 26 new letters' do
          expect{create(:theme)}.to change(Refinery::Terms::Letter, :count).by(26)
        end

      end

      context 'after destroy' do

        it 'deletes 26 letters' do
          theme = create(:theme)
          expect{theme.destroy}.to change(Refinery::Terms::Letter, :count).by(-26)
        end

      end

    end
  end
end