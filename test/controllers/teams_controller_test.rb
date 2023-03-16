require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get teams_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get teams_show_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get teams_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get teams_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get teams_destroy_url
  #   assert_response :success
  # end

  def setup
    @user = User.create(name: "Test Users",  email: "xyz@example.com", password: "12345678") 
    token = SecureRandom.hex(10)
    expire_at = Time.now + 15.minutes
    @user.update(token: token, expire_at: expire_at, logged_in: true)
  end  

# Index

test "should get new" do
  team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  get teams_url, params: {token: @user.token}
  assert_response :success
  team = JSON.parse(response.body)
  # assert_includes response.body, team.team_name
  # assert_includes, response.body, team.team_name
end

#Create

test "should create team" do
  tee_params = {team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red"}
  assert_difference ('Team.count') do
  post teams_url, params: {team: tee_params, token: @user.token}
  end
  assert_response :success 
  team = JSON.parse(response.body)
  # assert_includes response.body, tee_params[:team_name]
end  

#show

test "Should show team" do
  team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  get teams_url(team), params: {token: @user.token}
  assert_response :success
end

test "should update team" do
  team = Team.update(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  tee_params = {team_name: "Updated Team name", captain_name: "Updated Test Captain", jersey_color: "Updated Test captain" }
  patch team_url(team), params: {team: tee_params, token: @user.token}
  assert_response :success
  #team = JSON.parse(response.body)
  # team.reload
  # assert_equal tee_params[:team_name], team.team_name
end  


test "Should destroy team" do
  team = Team.create(team_name: "Test Team", captain_name: "Test Captain", jersey_color: "Red")
  assert_difference('Team.count', -1) do
    delete team_url(team), params: {token: @user.token}
  end
  assert_response :success
  #assert_equal " details has been created successfully", response.parsed_body["message"]
  #team = JSON.parse(response.body)
end  
end  


