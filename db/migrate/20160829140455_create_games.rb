class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :result
      t.integer :player_one_id
      t.integer :player_two_id
      t.datetime :date_played

      t.timestamps null: false
    end
  end
end
