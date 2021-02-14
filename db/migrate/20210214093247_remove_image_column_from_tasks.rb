class RemoveImageColumnFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :image
  end
end
