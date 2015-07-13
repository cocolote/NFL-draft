class PlayersController < ApplicationController
  respond_to :json

  def index
    last_added_players = Player.where.not(team: nil).order(updated_at: :desc).limit(3)
    players_teams = last_added_players.map { |p| { name: p.name, team_logo: p.team.logo } }
    respond_to do |f|
      f.json { render json: players_teams }
    end
  end

end
