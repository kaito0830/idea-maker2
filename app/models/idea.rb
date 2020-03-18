class Idea < ApplicationRecord
  validates :title, presence: true
  validates :info, presence: true
  validates :price, presence: true

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
