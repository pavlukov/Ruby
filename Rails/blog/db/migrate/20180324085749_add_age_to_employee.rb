class AddAgeToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :age, :integer
  end
end
