class Politree < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true
end
