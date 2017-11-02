class WorkOrder < ApplicationRecord
  has_many :attachments, :as => :attachmentable, :dependent => :destroy
  belongs_to :site
  belongs_to :technician, class_name: 'User', foreign_key: 'technician_id'
  belongs_to :creator, class_name: 'User', foreign_key: 'creator'
  belongs_to :survey
end
