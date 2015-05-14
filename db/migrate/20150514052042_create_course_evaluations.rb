class CreateCourseEvaluations < ActiveRecord::Migration
  def change
    create_table :course_evaluations do |t|
      t.integer :difficulty
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.timestamps null: false
    end
  end
end
