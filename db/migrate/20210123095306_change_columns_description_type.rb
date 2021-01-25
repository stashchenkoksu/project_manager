class ChangeColumnsDescriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :summary, :text, default: nil
    change_column :tasks, :content, :text, default: nil
  end
end
