class AddCreatorToCourseProfessor < ActiveRecord::Migration
  def change
    add_column :courses, :creator_id,  :integer
    add_column :professors, :creator_id, :integer

  end
end
