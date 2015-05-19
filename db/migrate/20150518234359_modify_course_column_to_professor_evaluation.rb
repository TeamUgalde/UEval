class ModifyCourseColumnToProfessorEvaluation < ActiveRecord::Migration
  def change
    remove_column :professor_evaluations, :course_name
    add_column :professor_evaluations, :course_id,  :integer
  end
end
