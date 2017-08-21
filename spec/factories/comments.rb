FactoryGirl.define do
  factory :comment do
    content { Faker::Movie.quote }

    association :photo, strategy: :build
  end
end
