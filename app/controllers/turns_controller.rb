class TurnsController < ApplicationController

  def index
    @teams = Turn.where(used: false).map { |turn| turn.team }
    @players = Player.all.order(:name)
    @offence, @defence = Position.positions
  end

end
