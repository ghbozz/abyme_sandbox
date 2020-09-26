class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { in: 5..200 }
  validates :description, presence: true
  validates :description, length: { in: 50..1000 }
end
