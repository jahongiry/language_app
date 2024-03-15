class MediaItem < ApplicationRecord
  belongs_to :lesson
  belongs_to :lesson
  has_many :translations, dependent: :destroy
  has_many :multiple_question, dependent: :destroy
  has_one_attached :image 
end
