class CreateProfessorCourseEvaluation < ActiveRecord::Migration
  def change
    create_table :professor_course_evaluations do |t|
      t.belongs_to :professor
      t.integer :course_id
      t.integer :evaluation_quantity, default: 0
      t.integer :overall_arrival_puntuality, default: 0
      t.integer :overall_feedback_puntuality, default: 0
      t.integer :overall_knowledge, default: 0
      t.integer :overall_addresses_question, default: 0
      t.integer :overall_learning_interest, default: 0
      t.integer :overall_difficulty, default: 0
      t.integer :overall_clearness, default: 0
      t.integer :overall_respect, default: 0
      t.integer :overall_score, default: 0

      t.timestamps null: false
    end
  end
end
