class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :image
      t.date :start_date
      t.string :due_date
      t.time :estimation

      t.timestamps
    end
  end
end
