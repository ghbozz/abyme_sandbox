class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, inverse_of: :task, dependent: :destroy

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
