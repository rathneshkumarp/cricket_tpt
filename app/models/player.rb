class Player < ApplicationRecord
  belongs_to :team

  validates :player_name, presence: true, uniqueness: { error: "Player name Should be unique"}
  validates :batting_style, presence: true
end
