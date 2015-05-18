class AddEvaluationQuantityAndDefaultToCourse < ActiveRecord::Migration
    def change
      add_column :courses, :evaluation_quantity,  :integer, default: 0
      change_column :courses, :overall_difficulty, :integer, default: 0
    end
end
