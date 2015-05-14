class CreateCoursesAndProfessors < ActiveRecord::Migration
  def change

    create_table :courses do |t|
      t.string :name
      t.float :overall_difficulty
      t.belongs_to :school, index: true
      t.timestamps null: false
    end

    create_table :professors do |t|
      t.string :name
      t.string :last_name
      t.float :overall_score
      t.belongs_to :school, index: true
      t.timestamps null: false
    end

    create_table :courses_professors, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :professor, index: true
    end

  end
end
