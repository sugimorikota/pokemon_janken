class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :body, null: false
      t.boolean :checked, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
