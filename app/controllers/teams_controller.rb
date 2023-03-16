class TeamsController < ApplicationController
 # before_action :authenticate_request

  def index
    teams = Team.all #.paginate(page: params[:page], per_page:3)
    render json: teams, status:200
  end

  # def paginate
  #   team = Team.paginate(page: params[:page], per_page:2)
  #   render json: team, status:200
  # end  

  def show
    # team = Team.find_by(id: params[:id])
    team = Team.joins(:tournaaments, :players).where(id: params[:id]).select("teams.*,tournaaments.team_id, tournaaments.no_of_matches, tournaaments.match_no, tournaaments.start_date, tournaaments.end_date, tournaaments.toss, players.player_name, players.batting_style")
    render json: team, status: 200
  end  

  # def join
  #   team = Team.joins(:tournaaments, :players).select("teams.*,tournaaments.team_id, tournaaments.no_of_matches, tournaaments.match_no, tournaaments.start_date, tournaaments.end_date, tournaaments.toss, players.player_name, players.batting_style ")
  #   render json: team, status:200
  # end

 
  def create
    team = Team.create(
      team_name: tee_params[:team_name],
      captain_name: tee_params[:captain_name],
      jersey_color: tee_params[:jersey_color]
    )
    if team.save
      render json:team, status:200
    else
      render json: team.errors.details, status: 422
      # render json:{
      #   error: "Unable to update team details"
      # }  
    end  
  end

  def update
    team = Team.find_by(id: params[:id])
    if team
      team.update(
        team_name: params[:team_name],
       captain_name: params[:captain_name],
       jersey_color: params[:jersey_color]
      )
      render json: "Team details updated successfully"
    else
      render json: {
        error: "unable to update team details in record"
      }  
    end  
  end

  def destroy
    team = Team.find_by(id: params[:id])
    if team
      team.destroy
      render json: "Teams details deleted sucessfully"
    end  
  end
  
  def tee_params
    params.require(:team).permit([
      :team_name,
      :captain_name,
      :jersey_color
    ])
  end  
end
