class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.text :token
      t.datetime :expire_at

      t.timestamps
    end
  end
end
