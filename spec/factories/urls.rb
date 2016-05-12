FactoryGirl.define do

  factory :url, :class => Refinery::Terms::Url do
    title Faker::Lorem.word
    url Faker::Internet.url
  end

  factory :link, :class => Refinery::Terms::Link do
    title Faker::Lorem.word
    url Faker::Internet.url
  end

  factory :reference, :class => Refinery::Terms::Reference do
    title Faker::Lorem.word
    url Faker::Internet.url
  end

  factory :tool, :class => Refinery::Terms::Tool do
    title Faker::Lorem.word
    url Faker::Internet.url
  end

end