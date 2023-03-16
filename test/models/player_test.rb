require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @player_name = "Sachin Tendulkar"
    @batting_style = "Right-handed"
    @player = Player.create(player_name: @player_name, batting_style: @batting_style)
    # assert player.valid?
  end

  # test "should have name, player and batting style fields" do
  #   player = Player.new(player_name: 
  #     batting_style: 
  #   )
  # end
 
  test "player name should be present" do
    @player.player_name = ""
    assert_not @player.valid?
  end

  test "both player name and batting style should be valid and present" do
    team = Team.create(team_name:"Chennai Super Kings", captain_name:"Ms Dhoni", jersey_color:"Yellow")
    @player = team.players.new(player_name: "Sachin Tendulkar", batting_style: "Right-handed")
     assert @player.valid?
  end

  test "batting style should be present" do
    @player.batting_style = ""
    assert_not @player.valid?
  end

  test "batting name should not be too long" do
    @player.batting_style = "s" * 50
    assert_not @player.valid?
  end
 
  test "player name should be unique" do
    duplicate_player = @player.dup
    duplicate_player.player_name.upcase!
    @player.save
    assert_not duplicate_player.valid?
  end

  test "player name and batting style should be acessible" do
    assert_equal @player_name, @player.player_name, "player name is not accessible"
    assert_equal @batting_style, @player.batting_style, "Batting style is not accessible"
  end

  # test "player name should be present" do
  #   player = Player.new(player_name: nil, batting_style: "Right-handed")
  #   assert_not player.valid?
  # end
end
