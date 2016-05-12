FactoryGirl.define do

  factory :term, :class => Refinery::Terms::Term do
    title Faker::Lorem.word
    definition Faker::Lorem.sentence
    description Faker::Lorem.sentence
    master_id 1
  end

end