class Review < ApplicationRecord
  belongs_to :list

  validates :content, presence: true
  validates :stars, presence: true
end
