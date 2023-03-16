class Team < ApplicationRecord
    has_many :players
    has_many :tournaaments
    validates :team_name, presence: true, uniqueness: { error: "Team Should be unique"}
    validates :captain_name, presence: true
    validates :jersey_color, presence: true
end
