FactoryBot.define do
  factory :user, class: User do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name }
    admin {false}
    email {Faker::Internet.email(name: first_name + "_" + last_name)}
    password {Faker::Internet.password(min_length: 6)}
    team
    factory :user_with_tasks do
      transient do
        task_count {20}
      end
      after(:create) do |user, evaluator|
        create_list(:task, evaluator.task_count, user: user)
        user.reload
      end
    end
  end

end

