class Teacher < ApplicationRecord
  has_many :lectures
  has_many :students, through: :lectures
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Name must consist of letters only!" }
  after_save :save_message

  def save_message
    puts "succesfully saved."
  end
end
