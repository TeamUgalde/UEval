class AddStateColumnToProfessorAndCourse < ActiveRecord::Migration
  def change
    add_column :courses, :accepted, :boolean, default: false
    add_column :users, :accepted, :boolean, default: false
  end
end
