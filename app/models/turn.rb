class Turn < ActiveRecord::Base
  belongs_to :team

  validates :round,
    presence: true

  validates :turn,
    presence: true

  validates :team,
    presence: true
end
