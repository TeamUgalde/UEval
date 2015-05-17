class ChangeAcceptedColumnForCourseProfessor < ActiveRecord::Migration
  def change
    remove_column :courses, :accepted
    remove_column :users, :accepted
    add_column :courses, :state,  :string, default: 'pending'
    add_column :professors, :state,  :string, default: 'pending'
  end
end
