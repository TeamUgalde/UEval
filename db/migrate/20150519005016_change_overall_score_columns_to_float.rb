class ChangeOverallScoreColumnsToFloat < ActiveRecord::Migration
  def change
    change_column :professors, :overall_score, :float, default: 0
    change_column :professor_course_evaluations, :overall_score, :float, default: 0
  end
end
