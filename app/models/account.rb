################################################################################
# Model:  Account
#
# Purpose:
#
# Account attributes:
#   name              - name:           string,  not NULL, unique
#   avatar             - avatar:  string
#   position          - sorting index:  integer, not NULL
#   status            - status:         enum { active (0) | archived (1) }
#
#  01.05.2017 ZT
################################################################################
class Account < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  before_save :set_position

  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true

  private

    def set_position
      if self.id.blank?
        last_item = Account.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
