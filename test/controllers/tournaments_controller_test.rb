require "test_helper"

class TournamentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678") 
    token = SecureRandom.hex(10)
    expire_at = Time.now + 15.minutes
    @user.update(token: token, expire_at: expire_at, logged_in: true)
  end  
   
  test "should get index" do
    #(name: "Test Tournament")
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    tournaament = Tournament.create(team: team, no_of_matches: 74, match_no: 20, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id)
    get tournaments_url, params: {token: @user.token}
    assert_response :success
  end

  test "should get create" do
   team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
   tou_params = {teams: team, no_of_matches: 74, match_no: 20, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id}
    assert_difference ('Tournament.count') do
    post tournaments_url, params: {tournament: tou_params, token: @user.token}      
    end
    assert_response :success
  end

  test "should show tournament" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    tournaament = Tournament.create(team: team, no_of_matches: 74, match_no: 20, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0)
    get tournaments_url,  params: {token: @user.token}
    assert_response :success
  end

  test "should get update" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    tournament = Tournament.create(team: team, no_of_matches: 74, match_no: 20, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id)
    tou_params = {team: team, no_of_matches: 74, match_no: 21, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id} 
    patch tournament_url(tournament),  params: {tournament: tou_params, token: @user.token}
    assert_response :success
  end

  test "should get destroy" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    tournament = Tournament.create(team: team, no_of_matches: 3, match_no: 1, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id)
    assert_difference('Tournament.count', -1) do
      delete tournament_url(tournament), params: {token: @user.token}
    end
    assert_response :success
   end

  # test "should get show" do
  #   get tournaments_show_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   Team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  #   tournaament = Tournament.create(teams: team, no_of_matches: 3, match_no: 1, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0, team_id: team.id)
  #   tou_params = {toss: "Updated toss details", no_of_matches: 3, match_no: 1, start_date: "2023-03-15", end_date: "2023-03-20", match_date: "2023-03-15", matches_played: 0, team_id: team.id}
  #   post tournaments_url(tournament), params: {tournament: tou_params}
  #   assert_response :success
  #   # tournament.reload
  #   # assert_equal tou_params[:toss], tournaament.toss
  # end

  # test "Should destroy tournament" do
  #   team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  #   tournaament = Tournament.create(teams: team, no_of_matches: 3, match_no: 1, start_date: "2023-03-15", end_date: "2023-03-20", toss: "Team A", match_date: "2023-03-15", matches_played: 0)
  #   assert_difference('Tournament.count', -1) do
  #     delete tournaament_url(tournaament)
  #   end 
  #      assert_response :success
  # end

  # test "should get create" do
  #   get tournaments_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get tournaments_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get tournaments_destroy_url
  #   assert_response :success
  # end
end
