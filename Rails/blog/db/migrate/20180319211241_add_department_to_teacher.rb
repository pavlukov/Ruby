class AddDepartmentToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :department, :string
  end
end
