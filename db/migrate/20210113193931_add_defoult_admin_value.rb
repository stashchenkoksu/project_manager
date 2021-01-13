class AddDefoultAdminValue < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :admin, :boolean, default: false
    add_column :tasks, :status, :string
  end

  def down
    change_column :users, :admin, :boolean, default: nil

  end

end
