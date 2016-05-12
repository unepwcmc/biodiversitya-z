FactoryGirl.define do

  factory :section, :class => Refinery::Terms::Section do
    title Faker::Lorem.word
    body Faker::Lorem.sentence
  end

end