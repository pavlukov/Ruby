class Student < ApplicationRecord
  has_many :lectures
  has_many :teachers, through :lectures
end
