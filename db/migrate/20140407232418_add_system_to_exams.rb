class AddSystemToExams < ActiveRecord::Migration
  def change
    add_column :exams, :system, :boolean, null: false, default: false
  end
end
