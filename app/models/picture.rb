################################################################################
# Model:  Picture
#
# Purpose:
#
# Picture attributes:
#   plant_id          - FK
#   title             - title:          string,  not NULL
#   content           - content:  text
#   photo             - photo:  string
#   position          - sorting index:  integer, not NULL
#   status            - status:         enum { active (0) | archived (1) }
#
#  28.05.2017 ZT
################################################################################
class Picture < ApplicationRecord
  belongs_to     :plant
  mount_uploader :photo, PhotoUploader
  
  before_save :set_position

  enum status: %w(active archived)

  validates :plant, presence: true

  validates :title, presence: true

  private

    def set_position
      if self.id.blank?
        last_item = Picture.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
