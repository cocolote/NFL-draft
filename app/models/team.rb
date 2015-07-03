class Team < ActiveRecord::Base
  has_many :turns
  belongs_to :division

  validates :name,
    presence: true

  validates :division,
    presence: true
end
