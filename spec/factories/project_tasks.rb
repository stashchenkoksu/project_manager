FactoryBot.define do
  factory :task, class: Task do
    title { Faker::Verb.base }
    content { Faker::Movies::HarryPotter.quote }
    start_date { Faker::Date.between(from: '2014-09-23', to: '2016-09-25') }
    due_date { Faker::Date.between(from: '2016-09-26', to: '2020-09-25') }
    estimation { nil }

    association :project, factory: :project
  end
end
