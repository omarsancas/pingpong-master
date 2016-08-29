class AddPlayerTwoScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_two_score, :integer
  end
end
