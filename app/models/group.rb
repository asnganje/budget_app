class Group < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy
  validates :name, presence: true
  validates :icon, presence: true
end
