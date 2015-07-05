class Team < ActiveRecord::Base
  has_many :turns
  has_many :players
  belongs_to :division

  validates :name,
    presence: true

  validates :division,
    presence: true
end
