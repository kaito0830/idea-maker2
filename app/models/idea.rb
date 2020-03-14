class Idea < ApplicationRecord
  validates :title, presence: true
  validates :info, presence: true
  validates :price, presence: true
end
