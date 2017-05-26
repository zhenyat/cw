################################################################################
# Model:  Resume
#
# Purpose:
#
# Resume attributes:
#   name              - name:           string,  not NULL, unique
#   attachment             - attachment:  string
#
#  26.05.2017 ZT
################################################################################
class Resume < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :name,  presence: true, uniqueness: true
end
