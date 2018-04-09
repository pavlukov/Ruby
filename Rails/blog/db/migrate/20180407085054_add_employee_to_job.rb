class AddEmployeeToJob < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :employee, foreign_key: true
  end
end
