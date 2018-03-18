class Teacher < ApplicationRecord
  has_many :lectures
  has_many :students, through :lectures
end
