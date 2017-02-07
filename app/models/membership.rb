class Membership < ApplicationRecord
  validates :politree_id, presence: true
  validates :member_id, presence: true, uniqueness: {scope: :politree_id}
  belongs_to :member, class_name: User
end
