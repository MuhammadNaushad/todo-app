class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true,  length: { minimum: 5, maximum: 50 }
  validates :due_date, presence: true
end
