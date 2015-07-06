class PositionsController < ApplicationController
  respond_to :json

  def show
    players = Position.find(params[:id]).players.order(:name)
    respond_to do |f|
      f.json { render json: { players: players } }
    end
  end
end
