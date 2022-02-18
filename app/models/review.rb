class Review < ApplicationRecord
  belongs_to :list

  validates :content, presence: true
  validates :stars, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
