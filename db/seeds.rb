# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

#10.times do
# FactoryBot.create :random_project
#end

#3.times do
# FactoryBot.create :random_user
#end

#3.times do
# FactoryBot.create :team_with_users
#end

20.times do
  project = FactoryBot.create :project_with_teams
  project.teams.each do |team|
    team.users.each do |user|
      user.tasks.each do |task|
        task.project_id = project.id
        task.save
      end
    end
  end
end