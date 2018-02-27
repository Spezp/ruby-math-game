
class Game
  attr_accessor :round_num, :current_player, :player1, :player2, :game_over
  def initialize
    self.round_num = 1
    self.player1 = Player.new('Player 1')
    self.player2 = Player.new('Player 2')
    self.current_player = self.player1
    self.game_over = false
  end

  def switch_current_player
    if self.current_player == self.player1
      self.current_player = self.player2
    else self.current_player = self.player1
    end
  end

  def game_over?
    if self.current_player.lives == 0
      puts "#{self.current_player.name} loses!"
      switch_current_player
      puts "#{self.current_player.name} is the Winner!!"
      self.game_over = true
    end
  end

  def round
    num1 = rand(10)
    num2 = rand(10)
    right_answer = num1 + num2

    puts "----Round #{self.round_num}----\n"
    puts "P1: #{self.player1.lives}/3 *** P2: #{self.player2.lives}/3"
    puts "---Ready #{self.current_player.name}!---"
    puts "What is #{num1} plus #{num2}?"
    puts "> "

    player_answer = STDIN.gets.chomp
    if right_answer == player_answer.to_i
      puts "Thats correct!"
    elsif right_answer != player_answer.to_i
      puts "Thats incorrect!"
      self.current_player.lives -= 1
    end
    self.round_num += 1
    game_over?
    switch_current_player
  end

  def game_start
    while game_over == false
    round
  end
  end
end



