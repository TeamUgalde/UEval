class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.belongs_to :user, index: true
      t.text :description
      t.timestamps
    end
  end
end
