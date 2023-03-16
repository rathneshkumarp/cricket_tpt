require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest

  # setup do
  #   @team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  #   @player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: @team.id)
  # end

  # test "should get index" do
  #   get players_url
  #   assert_response :success
  # end

  # test "should create player" do
  #   assert_difference('Player.count') do
  #     post players_url, params: { player: {player_name: "New Test Player", batting_style:"Left Handed", team_id: @team.id} }
  #   end
  #   assert_response :success
  # end

  # test "should show player" do
  #   get players_url(@player)
  #   assert_response :success
  # end

  # # test "should update player" do
  # #   post players_url(@player), params: { player: {player_name: "Updated Player name", batting_style:"Left Handed", team_id: @team.id }}
  # #   assert_difference :success
  # #   @player.reload
  # #   assert_equal "Updated Player name", @player.player_name
  # # end

  # test "should destroy player" do
  #   player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: @team.id)
  #   assert_difference('Player.count', -1) do
  #     post players_url(player)
  #   end
  #   assert_response :success
  # end

  def setup
    @user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678") 
    token = SecureRandom.hex(10)
    expire_at = Time.now + 15.minutes
    @user.update(token: token, expire_at: expire_at, logged_in: true)
  end  

  test "should get index" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: team.id)
    get players_url, params: {token: @user.token}
    assert_response :success
  end

  test "should get create" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    pla_params = {player_name:"Test Player", batting_style:"Right Handed", team_id: team.id}
    assert_difference ('Player.count') do
    post players_url, params: {player: pla_params, token: @user.token}
    end
    assert_response :success 
      # assert_includes response.body, tee_params[:team_name]
    end
   
  # test "should get show" do
  #   get players_show_url
  #   assert_response :success
  # end

  test "should get show" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: team.id)
    get players_url(player), params: {token: @user.token}
    assert_response :success
  end


  test "show get update" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: team.id)
    pla_params = {player_name:"Updated Player", batting_style:"Right Handed", team_id: team.id}
    patch player_url(player), params: {player: pla_params, token: @user.token}
    assert_response :success
  end

  test "should get destroy" do
    team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
    player = Player.create(player_name:"Test Player", batting_style:"Right Handed", team_id: team.id)
    assert_difference('Player.count', -1) do
      delete player_url(player), params: {token: @user.token}
    end
    assert_response :success
  end  

  # test "should get create" do
  #   get players_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get players_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get players_destroy_url
  #   assert_response :success
  # end
end
