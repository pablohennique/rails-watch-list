class List < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true


  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end
