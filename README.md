# Create a 2-Player math game where players take turns to answer 
# simple math addition problems. A new math question is generated 
# for each turn by picking two numbers between 1 and 20. 
# The player whose turn it is is prompted the question and 
# must answer correctly or lose a life.

# classes required
# Player
  # player id or name
  # Will include all the information of a player including a player name or id
  # could include I/O if we want to setup names for the player
# Score
  # current_lives and amount_of_lives
  # Will be a representation of the score which can be initialized upon game start
  # track score and show how many lives a player has
# Question
  # question_type to be generated using a random integer
  # question_value_a and question_value_b being two numbers
  # A question with text to be answered by a player
  # should contain I/O so that a player can answer the questions
  # should pass result back to game to let it know if a player has answered correctly
# Game 
  # instances_of_players 
  # Class is somewhat optional as all logic for the game can be defined within the main rb file
  # should contain game state to track if game is starting, in progress, and ending
  # should also contain game state to track whose turn it is
  # should track the amount of lives that a player can have
  # should contain ouput when game is over to let player know that game is over
  # could also include the number of players if we want to increase to a 3 or 4 player game
