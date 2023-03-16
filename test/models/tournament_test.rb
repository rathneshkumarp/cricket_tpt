require "test_helper"

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @no_of_matches = 100
    @match_no = 1
    @start_date = Date.new(2023, 3, 1)
    @end_date = Date.new(2023, 5, 31)
    @toss = "Chennai Super kings won the toss, bat first"
    @match_date = Date.new(2023, 4, 1)
    @matches_played = 50
    @tournament = Tournament.create(no_of_matches: @no_of_matches, match_no: @match_no, 
      start_date: @start_date, end_date:@end_date, toss: @toss, match_date: @match_date,
    matches_played: @matches_played)
  end

  test "number of matches should be present" do
   @tournament.no_of_matches = ""
   assert_not @tournament.valid?, "no of matces cant't be blank"
  end

  test "match number should not be empty" do
    @tournament.match_no = ""
    assert_not @tournament.valid?, "match number can't be blank"
  end
  
  test "start date should be present" do
    @tournament.start_date = ""
    assert_not @tournament.valid?, "start date can't be blank"
  end
  
  test "end date should be present" do
    @tournament.end_date = ""
    assert_not @tournament.valid?, "end date can't be blank"
  end

  test "toss should not be empty" do
    @tournament.toss = ""
    assert_not @tournament.valid?, "toss can't be blank"
  end

  test "match date should be present" do
    @tournament.match_date = ""
    assert_not @tournament.valid?, "match date can't be blank"
  end

  test "match played should not be empty" do
    @tournament.matches_played = ""
    assert_not @tournament.valid?, "match date can't be blank"
  end

  test "no of matches should be a positive number" do
    @tournament.no_of_matches = -1
    assert_not @tournament.valid?, "No of matches should be a positive integer"
  end

  test "match no should be a positive number" do
    @tournament.match_no = -1
    assert_not @tournament.valid?, "match no should be positive integer"
  end

   test "start date should be before end date" do
    @tournament.start_date = Date.new(2023, 3, 1)
    assert_not @tournament.valid?, "start date should be before and date"
   end

   test "match date should be between start date and end date" do
    @tournament.match_date = Date.new(2023, 4, 1)
    assert_not @tournament.valid?, "Match date should be between start date and end date"
   end

  test "matches played should be less than or equal to no of matches" do
    @tournament.matches_played = 10
    assert_not @tournament.valid?, "Matches played should be less than or equal to no of matches"
  end

#  test "no of matches, match no, start date, end date, and matches played should be accessible" do
#   assert_equal @no_of_matches, @tournament.no_of_matches, "no of matches is not accessible"
#   assert_equal @match_no
#  end

end
