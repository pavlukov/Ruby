class AddJobToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :job, foreign_key: true
  end
end
