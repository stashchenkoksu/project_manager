class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :project
    add_reference :tasks, :user
    add_reference :users, :team
    add_reference :users ,:project
  end
end
