class Movie < ApplicationRecord
  # Associations
  has_many :bookmarks, dependent: :restrict_with_exception

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
