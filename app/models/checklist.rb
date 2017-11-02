class Checklist < ApplicationRecord
  TYPES = ['Info', 'Multiple Choice', 'Check', 'Select']
  belongs_to :survey
end
