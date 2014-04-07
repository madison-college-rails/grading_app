class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :student_name, null: false
      t.text :answers, null: false

      t.timestamps
    end
  end
end
