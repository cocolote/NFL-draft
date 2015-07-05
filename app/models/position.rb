class Position < ActiveRecord::Base
  has_many :players

  validates :name,
    presence: true

  def self.positions
    positions = Position.all
    offe = []
    defe = []
    positions.each do |pos|
      if %w(FB QB C OG OT P RB TE WR).include?(pos.name)
        offe << pos
      else
        defe << pos
      end
    end

    return [offe, defe]
  end
end
