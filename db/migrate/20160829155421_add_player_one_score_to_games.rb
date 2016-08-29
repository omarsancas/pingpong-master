class AddPlayerOneScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_one_score, :integer
  end
end
