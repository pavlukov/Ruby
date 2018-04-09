class AddEmployeesToJob < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :job, foreign_key: true
  end
end
