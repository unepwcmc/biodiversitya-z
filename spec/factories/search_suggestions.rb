# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search_suggestion do
    term "MyString"
    popularity 1
  end
end
