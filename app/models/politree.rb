class Politree < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :owner_id, presence: true
  belongs_to :owner, class_name: User
  has_many :memberships
  has_many :members, through: :memberships
  has_many :issues
end
