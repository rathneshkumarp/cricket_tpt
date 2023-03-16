class PlayersController < ApplicationController
  before_action :authenticate_request

  def index
    players = Player.all #.paginate(page: params[:page], per_page:2)
    render json: players, status: 200
  end


  def show
    player = Player.find_by(id: params[:id])
    if player
      render json: player, status:200
    else
      render json: "unable to find player details"
    end    
  end

  def search
    player = Player.where("player_name LIKE ?", "%#{params[:search]}%")
    render json: player  
  end  


  def create
    player = Player.create(
      player_name: pla_params[:player_name],
      batting_style: pla_params[:batting_style],
      team_id: pla_params[:team_id]
    )
    if player.save
      render json: player, status:200
    else
      render json: player.errors.details, status: 422
      # render json: {
      #   error: "Unable to create player name"
      # }
    end  
  end

  def update
     player = Player.find_by(id: params[:id])

     if player
      player.update(
        player_name: params[:player_name],
        batting_style: params[:batting_style],
        team_id: params[:teeam_id]
      )
      render json: "Players details updated sucessfully"
    else
      render json: {
        error: "Unable to find players details in record"
      }
    end    
  end

  def destroy
    player = Player.find_by(id: params[:id])
    if player
      player.destroy
      render json: "Players details deleted sucessfully"
    end  
  end

  def pla_params
    params.require(:player).permit([
      :player_name, 
      :batting_style,
      :team_id
    ])
  end  
end
