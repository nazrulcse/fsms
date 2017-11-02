class Attachment < ApplicationRecord
  belongs_to :attachmentable, :polymorphic => true,optional: true
  mount_uploader :attachment, AttachmentUploader
end
