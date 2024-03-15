class MultipleQuestion < ApplicationRecord
  belongs_to :media_item
  has_many :answers, dependent: :destroy
end
