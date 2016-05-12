module Refinery
  module Terms
    describe Section do

      context 'validations' do

        it 'is invalid without title' do
          build(:section, title:nil).should_not be_valid
        end

        it 'is invalid without body' do
          build(:section, body:nil).should_not be_valid
        end

      end

    end
  end
end