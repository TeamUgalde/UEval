class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :banner
      t.string :webpage

      t.timestamps null: false
    end
  end
end
