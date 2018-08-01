class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
# helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, indx|
      next if indx == 6 || indx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def make_move(start_pos, current_player_name)
# empties cup
    stone = @cups[start_pos]
    @cups[start_pos] = []
# distributes stones
    cup_indx = start_pos
    until stone.empty?
      cup_indx += 1
      cup_indx = 0 if cup_indx > 13
# places stones in the correct current player's cups
      case cup_indx
      when 6
        @cups[6] << stone.pop if current_player_name == @name1
      when 13
        @cups[13] << stone.pop if current_player_name == @name2
      else
        @cups[cup_indx] << stone.pop
      end
    end
    render
    next_turn(cup_indx)
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def next_turn(ending_cup_idx)
# helper method to determine what #make_move returns ended on store -- get to choose where to start again
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on empty cup -- switches players' turns
    return :switch if @cups[ending_cup_idx].count == 1
      # ended on cup with stones in it -- automatically starts there
    ending_cup_idx
    #end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    pl_one_ct = @cups[6].count
    pl_two_ct = @cups[13].count
    return :draw if pl_one_ct == pl_two_ct
    pl_one_ct > pl_two_ct ? @name1 : @name2
  end
end
