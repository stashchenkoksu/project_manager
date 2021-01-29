class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.string :commentable_type
      t.integer :commentable_id
      t.string :username
      t.text :body
      t.references :parent, foreign_key: true


      t.timestamps
    end
  end
end
