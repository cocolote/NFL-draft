class TurnsController < ApplicationController

  def index
    @team = Team.first
  end

end
