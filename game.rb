require "./player"
require "./question"

class Game
  # game states
  START_GAME = 0
  PLAYING = 1
  END_GAME = 2 
  
  attr_accessor :game_state, :current_player, :players 

  def initialize
    # Set initial game state
    @game_state = START_GAME
    # Create players array
    @players = []
    # set the current player to the first player
    @current_player = 0
  end

  # method to run upon game start
  def start_game
    puts "Welcome to the simple math game!"
    # will return an error if num_players is not an integer
    puts "How many players would like to play?"
    num_players = Integer($stdin.gets.chomp)
    # will return an error if num_lives is not an integer
    puts "How many lives should each player have?"
    num_lives = Integer($stdin.gets.chomp)
    # Set up array of players
    for i in 0..(num_players - 1)
      players << Player.new("#{i + 1}", num_lives)
    end
    # set the game state
    self.game_state=PLAYING
  end

  # method to run a single question of the game
  def run_question
    question = Question.new
    question.run_question(players[self.current_player])
    # Display player scores
    for player in players do
      print "#{player.player_id}: #{player.lives_to_s} " 
    end 
    print "\n"
    # Check if there is a player alive and all other players have lost their lives
    check_alive
    # Cycle through players and determine whose turn it is
    inc_player_turn
  end

  # Check how many players are still alive and update gamestate accordingly
  def check_alive
    alive_count = 0
    for player in players do  
      if player.current_lives > 0
        alive_count += 1;
      end
    end
    if alive_count <= 1
      self.game_state=END_GAME
    end
  end

  # method to cycle between players and alter whose turn it is
  def inc_player_turn
    if self.current_player < self.players.size - 1
      self.current_player += 1
    else 
      self.current_player = 0
    end
  end

  # method to run when game has completed
  def game_over
    # determine who the winner is
    for player in players do
      if player.current_lives > 0
        puts "----- GAME OVER -----"
        puts "#{player.player_id} wins with a score of #{player.lives_to_s}"
        puts "Good bye!"
      end
    end
  end

  # method to run the game
  def run_game
    start_game
    while game_state == PLAYING
      run_question
    end
    game_over
  end
end