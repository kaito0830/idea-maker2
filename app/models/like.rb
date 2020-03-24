class Like < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates_uniqueness_of :idea_id, scope: :user_id

  def already_liked?(idea)
    self.likes.exists?(idea_id: idea.id)
  end
end
