require "byebug"
require_relative "player.rb"

class Game
  attr_accessor :fragment
  attr_reader :game_over

  def initialize(file, player_1="Player 1", player_2="Player 2")
    @dictionary = read_file(file)
    @player_one = Player.new(player_1)
    @player_two = Player.new(player_2)
    @fragment = ""
    @ghost = Hash.new
  end

  def play
    "Let's play a game."

    until @ghost.values.include?("GHOST")
      play_round
    end

    puts "#{@player1.name} has won the game!"
  end

  def play_round

    until @game_over
      in_round_display
      update_players
      take_turn(@current_player)
      puts ""
    end

    end_round
    end_round_display
    reset
  end

  def reset
    @fragment = ""
    @game_over = false
  end

  def end_round
    @current_player.lost
    record(@current_player)
  end

  def record(player)
    @ghost[player] = "GHOST"[0...player.losses]
  end

  def end_round_display
    puts "#{@previous_player.name} won!"
    puts ""
    puts "Current Score:"
    puts "#{@player_one.name}: #{@ghost[@player_one]}"
    puts "#{@player_two.name}: #{@ghost[@player_two]}"
    puts "-----"
    puts ""
  end

  def in_round_display
    puts "The current fragment is: '#{@fragment}'" if @fragment != ""
  end

  def take_turn(player)
    player_letter = player.guess
    temp_fragment = @fragment + player_letter

    if valid_play?(temp_fragment)
      @fragment = temp_fragment
    else
      @game_over = true
    end
  end

  def update_players
    @previous_player = @current_player
    @current_player = next_player!
  end

  def next_player!
    @current_player == @player_one ? @player_two : @player_one
  end

  def valid_play?(fragment)
    elimination = @dictionary.select { |_k, v| v.include?(fragment)}

    if elimination.empty?
      return false
    else
      return true
    end
  end

  def read_file(file)
    dictionary_hash = Hash.new

    File.readlines(file).each do |line|
      file_line = line.chomp
      dictionary_hash[file_line] = dictionary_substr(file_line)
    end

    dictionary_hash
  end

  def dictionary_substr(word)
    result = []
    word.chars.each_index do |i|
      next if i == word.length - 1
      result << word[0..i]
    end
    result
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("dictionary.txt")
  game.play
end
