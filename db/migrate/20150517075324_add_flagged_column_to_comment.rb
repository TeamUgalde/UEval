class AddFlaggedColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :flagged, :boolean, default: false
  end
end
