################################################################################
# Model:  Plant
#
# Purpose:
#
# Plant attributes:
#   name              - name:           string,  not NULL, unique
#   title             - title:          string,  not NULL
#   position          - sorting index:  integer, not NULL
#   status            - status:         enum { active (0) | archived (1) }
#
#  26.05.2017 ZT
################################################################################
class Plant < ApplicationRecord
  has_many                      :pictures, inverse_of: :plant
  accepts_nested_attributes_for :pictures
  
  before_save :set_position

  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true

  private

    def set_position
      if self.id.blank?
        last_item = Plant.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
