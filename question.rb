require "./player"

class Question 
  MAX_VALUE = 20

  attr_accessor :question_value_a, :question_value_b

  def initialize
    @question_value_a = Random.rand(MAX_VALUE);
    @question_value_b = Random.rand(MAX_VALUE);
  end

  # run a single question of the game
  def run_question(current_player)
    puts "----- NEW TURN -----"
    puts "#{current_player.player_id}: What does #{self.question_value_a} plus #{self.question_value_b} equal? \n"
    answer = $stdin.gets.chomp
    if answer == (self.question_value_a + self.question_value_b).to_s
      puts "#{current_player.player_id}: YES! You are correct\n"
    else
      puts "#{current_player.player_id}: Seriously? No!\n"
      current_player.lose_life
    end
  end 
end