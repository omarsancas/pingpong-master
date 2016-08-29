class Game < ActiveRecord::Base
  belongs_to :player_one, :class_name => "User"
  belongs_to :player_two, :class_name => "User"

  def self.create_game(date, current_user, opponent_id, current_player_score, opponent_score)    
    game = Game.create(date_played: date, player_one_id:current_user, player_two_id: opponent_id)
  end
end
