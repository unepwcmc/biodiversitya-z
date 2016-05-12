FactoryGirl.define do

  factory :theme, :class => Refinery::Terms::Theme do
    title Faker::Lorem.word
    tagline Faker::Lorem.sentence
    description Faker::Lorem.sentence
    synopsis Faker::Lorem.sentence
  end

end