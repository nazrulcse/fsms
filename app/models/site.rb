class Site < ApplicationRecord
  belongs_to :zone
  has_many :work_orders
end
