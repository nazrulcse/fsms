class Survey < ApplicationRecord
  has_many :checklists
  has_many :work_orders
  belongs_to :user
end
