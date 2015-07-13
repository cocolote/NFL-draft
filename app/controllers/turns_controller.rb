class TurnsController < ApplicationController
  respond_to :json, :html

  def index
    @turns = Turn.where(used: false)
    @players = Player.all.order(:name)
    @last_added_players = Player.where.not(team: nil).order(updated_at: :desc).limit(3)
    @offence, @defence = Position.positions
  end

  def update
    turn =  Turn.find(params[:id])
    if turn.used
      respond_to do |f|
        f.json { render json: { message: "This turn is not available" }, status: 403 }
      end
    else
      player = Player.find(params[:player_id])
      team = Team.find(params[:team_id])
      if player.team
        respond_to do |f|
          f.json { render json: { message: "Already assigned to a team" }, status: 403 }
        end
      else
        turn.update(used: true)
        player.update(team: team)
        respond_to do |f|
          f.json { render json: { team: team, turn: turn } }
        end
      end
    end
  end
end
