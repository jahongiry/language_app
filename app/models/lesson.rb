class Lesson < ApplicationRecord
  belongs_to :user
  has_many :text_question_sets, dependent: :destroy
  has_many :media_items, dependent: :destroy
end
