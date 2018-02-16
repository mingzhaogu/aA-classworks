class Player

  attr_accessor :losses
  attr_reader :name, :lost

  def initialize(name)
    @name = name
    @losses = 0
  end

  def guess
    print "#{@name}, please enter your letter: "

    begin
      input = gets.chomp.downcase
      alert_invalide_guess(input)
    rescue
      print "That's not a valid input. Please enter another letter: "
      retry
    end
  end

  def alert_invalide_guess(input)
    valid_inputs = ("a".."z").to_a

    if valid_inputs.include?(input)
      return input
    else
      raise ArgumentError
    end
  end

  def lost
    @losses += 1
  end

end
