class Issue < ApplicationRecord
  validates :topic, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :politree
end
