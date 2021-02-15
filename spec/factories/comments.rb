FactoryBot.define do
  factory :comment do
    body { Faker::Hipster.sentence }

    association :user, factory: :user
    association :commentable, factory: :project
  end
end
