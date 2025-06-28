class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content
      t.datetime :deadline
      t.timestamps
    end
  end
end
