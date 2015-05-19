class AddEvaluationColumnsToProfessor < ActiveRecord::Migration
  def change
    add_column :professors, :evaluation_quantity,  :integer, default: 0
    add_column :professors, :overall_arrival_puntuality,  :integer, default: 0
    add_column :professors, :overall_feedback_puntuality,  :integer, default: 0
    add_column :professors, :overall_knowledge,  :integer, default: 0
    add_column :professors, :overall_addresses_questions,  :integer, default: 0
    add_column :professors, :overall_learning_interest,  :integer, default: 0
    add_column :professors, :overall_difficulty,  :integer, default: 0
    add_column :professors, :overall_clearness,  :integer, default: 0
    add_column :professors, :overall_respect,  :integer, default: 0
    change_column :professors, :overall_score, :integer, default: 0
  end
end
