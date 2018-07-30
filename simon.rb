class Simon
  COLORS = %w(red blue green yellow)
  POSITIVE_MESSG = ["You rock!", "Awesome!", "Great job!", "Nice one!" ]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end
  def play
    puts "Round #{sequence_length}! Here we go: "
    until @game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.70
      system("clear")
      sleep 0.30
    end
  end

  def require_sequence
    # require_sequence is to prompt the user to repeat back the new sequence that was just shown to them, one color at a time. If they give an incorrect color, it should immediately set @game_over to be true.
    puts "Match the color sequence! Enter the color's first letter [e.g. 'r' enter 'b' enter for red, blue]:  "
    @seq.each do |color|
      color_input = gets.chomp
      if color[0] != color_input
        @game_over = true
        break
      end
    end
    sleep 0.30
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
     puts POSITIVE_MESSG.shuffle[0]
     puts "Round #{sequence_length}"
  end

  def game_over_message
    puts 'Game over. Would you like to try again? yes or no?'
    input = gets.chomp


    if input == 'yes'
      system("clear")
      reset_game
    elsif input == 'no'
      puts "Thanks for playing!"
      Process.exit!(true)
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    sleep 0.75
    play
  end
end


# if __file__ = $PROGRAM_NAME
#   game = Simon.new
#   game.play
# end
