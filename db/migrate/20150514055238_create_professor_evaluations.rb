class CreateProfessorEvaluations < ActiveRecord::Migration
  def change
    create_table :professor_evaluations do |t|
      t.integer :arrival_puntuality
      t.integer :feedback_puntuality
      t.integer :knowledge
      t.integer :addresses_questions
      t.integer :learning_interest
      t.integer :difficulty
      t.integer :clearness
      t.integer :respectful
      t.string :course_name
      t.float :overall_score
      t.belongs_to :user, index: true
      t.belongs_to :professor, index: true

      t.timestamps null: false
    end
  end
end
