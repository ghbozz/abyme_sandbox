class Project < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :title, length: { in: 5..200 }
  validates :description, presence: true
  validates :description, length: { in: 30..500 }
  validates :thumbnail, presence: true
end
