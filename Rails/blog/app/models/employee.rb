class Employee < ApplicationRecord
  belongs_to :job
  validates :age, numericality: { only_integer: true, greater_then_or_equal_to: 18, less_then: 100 }
end
