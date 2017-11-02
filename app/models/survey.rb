class Survey < ApplicationRecord
  has_many :checklists
  belongs_to :user
end
