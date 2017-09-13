class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.references :sender
      t.references :recipient
      t.timestamps
    end
  end
end
