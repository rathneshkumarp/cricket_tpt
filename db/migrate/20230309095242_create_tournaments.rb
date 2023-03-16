class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.text :no_of_matches
      t.text :match_no
      t.text :start_date
      t.text :end_date
      t.text :toss
      t.text :match_date
      t.text :matches_played
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
