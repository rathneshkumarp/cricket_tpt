require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 def setup
  @team_name = "Chennai Super Kings"
  @captain_name = "Ms Dhoni"
  @jersey_color = "Yellow"
  @team = Team.create(team_name: @team_name, captain_name: @captain_name, jersey_color: @jersey_color)
 end  

 test "Team name should not be empty" do
  @team.team_name = ""
  assert_not @team.valid?
 end  

 test "All the field should be valid and present" do
  team = Team.create(team_name:"Chennai Super Kings", captain_name:"Ms Dhoni", jersey_color:"Yellow")
  assert @team.valid?
 end

  test "captain name should present" do
   @team.captain_name = "" 
   assert_not @team.valid?
  end

 test "jersey color should be present" do
  @team.jersey_color = ""
  assert_not @team.valid?
 end

end
