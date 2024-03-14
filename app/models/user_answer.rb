class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :answer_feedback, dependent: :destroy
end
