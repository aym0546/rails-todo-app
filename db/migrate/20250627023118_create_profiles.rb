class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.boolean :subscribed, default: false
      t.timestamps
    end
  end
end
