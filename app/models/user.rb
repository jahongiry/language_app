class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end