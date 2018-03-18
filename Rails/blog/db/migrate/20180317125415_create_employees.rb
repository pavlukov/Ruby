class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|

      t.timestamps
    end
  end
end
