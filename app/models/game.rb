class Game < ActiveRecord::Base
  belongs_to :player_one, :class_name => "User"
  belongs_to :player_two, :class_name => "User"

  #Create Game to calculate scores and ratings
  def self.create_game(date, current_user, opponent_id, current_player_score, opponent_score)
    game = Game.new(:player_one_id => current_user,
                    :player_two_id => opponent_id,
                    :player_one_score => current_player_score,
                    :player_two_score => opponent_score)

    if current_player_score < opponent_score
      game.lost
    elsif current_player_score > opponent_score
      game.win
    elsif current_player_score == opponent_score
      game.draw
    end

  end


  # objects to update their scores.
  def process_result(new_result)
    self.result = new_result
    calculate
  end

  def calculate
    if self.result
      player_one.send(:played, self)
      player_two.send(:played, self)
      save
    end
    self
  end

  # User +:one+ has won!
  # This is a shortcut method for setting the score to 1
  def win
    process_result 1.0
  end

  # User +:one+ has lost!
  # This is a shortcut method for setting the score to 0
  def lose
    process_result 0.0
  end

  # It was a draw.
  # This is a shortcut method for setting the score to 0.5
  def draw
    process_result 0.5
  end


  def ratings
    @ratings ||= { player_one => rating_one, player_two => rating_two }
  end


  private

	# Create an Elo::Rating object for player one
  def rating_one
    new_rating_hash = Elo.new_ratings(:result        => self.result,
               :old_rating    => player_one.rating,
               :other_rating  => player_two.rating)
  end

	# Create an Elo::Rating object for player two
  def rating_two
    new_rating_hash = Elo.new_ratings(:result        => (1.0 - self.result),
               :old_rating    => player_two.rating,
               :other_rating  => player_one.rating)
  end

end
