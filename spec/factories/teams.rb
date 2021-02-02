FactoryBot.define do
  factory :team, class: Team do
    name {Faker::Team.name}

    factory :team_with_users do
      transient do
        user_count {2}
      end
      after(:create) do |team, evaluator|
        create_list(:user_with_tasks, evaluator.user_count, team: team)
        team.reload
        end
    end
  end
end

