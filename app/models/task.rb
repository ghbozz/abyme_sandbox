class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, inverse_of: :task, dependent: :destroy

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :title, length: { in: 5..200 }
  validates :description, presence: true
  validates :description, length: { in: 30..500 }

  scope :done, -> { where(status: 'done') }
  scope :todo, -> { where(status: 'todo') }
end

