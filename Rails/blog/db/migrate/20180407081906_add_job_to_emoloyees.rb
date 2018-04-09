class AddJobToEmoloyees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :job
  end
end
