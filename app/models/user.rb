class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  private

  # informed to update their
  # scores, after it knows the result (so it can calculate the rating).
  #
  # This method is private, because it is called automatically.
  def played(game)
    games = []
    games << game
    self.rating = game.ratings[self].new_rating
    save
  end

end
