class Elo < ActiveRecord::Base
  def self.new_ratings(player1_rating,player2_rating,result)
      k_value = 32
      should_round = true
	   	#Assign actual individual results
	   	player1_result = result
	   	player2_result = 1 - result

	   	#Calculate expected results
	   	player1_expectation = 1/(1+10**((player2_rating - player1_rating)/400.0)) #the .0 is important to force float operations!))
	   	player2_expectation = 1/(1+10**((player1_rating - player2_rating)/400.0))

	    #Calculate new ratings
	   	player1_new_rating = player1_rating + (k_value*(player1_result - player1_expectation))
	   	player2_new_rating = player2_rating + (k_value*(player2_result - player2_expectation))

	   	#Optional rounding
	   	if should_round
	      # int rounds down and forces type
	      player1_new_rating = player1_new_rating.round
	      player2_new_rating = player2_new_rating.round
	    end

	   	new_ratings_hash['player1'] = player1_new_rating
	   	new_ratings_hash['player2'] = player2_new_rating

   		new_ratings_hash
	end
end
