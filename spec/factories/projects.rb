FactoryBot.define do
  factory :project, class: Project do
    name {Faker::App.name }
    summary {Faker::Lorem.sentence(word_count: 20)}
    start_date {Faker::Date.between(from: '2014-09-23', to: '2016-09-25')}
    end_date {Faker::Date.between(from: '2016-09-26', to: '2020-09-25')}

    factory :project_with_teams do
      transient do
        teams_count { 2 }
      end

      after(:create) do |project, evaluator|
        create_list(:team_with_users, evaluator.teams_count, projects: [project])
        project.reload
      end
    end
  end
end
