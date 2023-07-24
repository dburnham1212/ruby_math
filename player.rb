class Player
  attr_accessor :id, :current_lives, :max_lives

  def initialize(id, max_lives)
    @id = id;
    @max_lives = max_lives
    @current_lives = max_lives
  end

  # print the Player + id that they are initialized with
  def player_id
    "Player #{id}"
  end

  # lose a life
  def lose_life
    self.current_lives -= 1
  end

  # string with amount of lives remaining
  def lives_to_s
    "#{self.current_lives}/#{self.max_lives}"
  end
end