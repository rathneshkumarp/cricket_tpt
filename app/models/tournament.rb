class Tournament < ApplicationRecord
  belongs_to :team

  validates :no_of_matches, presence: true, length: {minimum:1, maximum:3}
  validates :match_no, presence: true, uniqueness: { error: "number Should be not be repeat"}, length: {minimum:1, maximum:3}
  validates :start_date, presence: true #{  message: "should happen once per year" }
  validates :end_date,  presence: true #{  message: "should be valid date" }
  validates :toss, presence: true
  validates :match_date, presence: true #{ message: "should be valid date" } 
  validates :matches_played, presence: true, length: {minimum:1, maximum:3}
end
