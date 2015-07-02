class Player < ActiveRecord::Base
  belongs_to :position

  validates :name,
    presence: true

  validates :position,
    presence: true
end
