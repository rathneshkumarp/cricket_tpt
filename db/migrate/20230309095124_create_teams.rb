class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :captain_name
      t.string :jersey_color

      t.timestamps
    end
  end
end
