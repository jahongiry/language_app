class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :lessons, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  def teacher?
    teacher
  end
end