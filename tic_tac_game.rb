#the problem
#Create a 3x3 board grid aleternating between players turns until there are 
#three of a kind in a row or there are no more turns left

#Create tic_tac_game class 
class TicTacGame

    def initialize()
    @array = [[" ", " ", " "],[" ", " ", " "], [" ", " ", " "]]
    @coordinates = %w(a1 a2 a3 b1 b2 b3 c1 c2 c3)
    @a1 = @array[0][0]
    @a2 = @array[0][1]
    @a3 = @array[0][2]
    @b1 = @array[1][0]
    @b2 = @array[1][1]
    @b3 = @array[1][2]
    @c1 = @array[2][0]
    @c2 = @array[2][1]
    @c3 = @array[2][2]
    @turns = 0
    @turn_type = "x"
    end
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
# place respective marks on board
  def place_mark(type, mark)
    case type
    when "a1"
      @array[0][0] = mark
    when "a2"
      @array[0][1] = mark
    when "a3"
      @array[0][2] = mark
    when "b1"
      @array[1][0] = mark
    when "b2"
      @array[1][1] = mark
    when "b3"
      @array[1][2] = mark
    when "c1"
      @array[2][0] = mark
    when "c2"
      @array[2][1] = mark
    when "c3"
      @array[2][2] = mark
    end
  end
  #check if coordinate has already been marked
  def check_coord_marked?(coord)
    case coord
    when "a1"
      if @array[0][0] != " "
      true
      end
    when "a2"
      if @array[0][1] != " "
        true
        end
    when "a3"
      if @array[0][2] != " "
        true
        end
    when "b1"
      if @array[1][0] != " "
        true
        end
    when "b2"
      if @array[1][1] != " "
        true
        end
    when "b3"
      if @array[1][2] != " "
        true
        end
    when "c1"
      if @array[2][0] != " "
        true
        end
    when "c2"
      if @array[2][1] != " "
        true
        end
    when "c3"
      if @array[2][2] != " "
        true
        end
    end
  end


  #method x_player_turn Ask where to place new X on board
  def x_player_turn
    print "Player X:"
    @x_player_choice = gets.chomp
    #Make sure that the player inputs a correct input
    if check_coord_marked?(@x_player_choice)
    print "Already marked please try again\n"
    self.x_player_turn
    elsif @coordinates.any?{|i| i==@x_player_choice}
      self.place_mark(@x_player_choice, "x")
    else
      print "Not a valid Coordinate try again \n"
      self.x_player_turn
    end
  end

  #method o_player_turn Ask where to place new O on board
  def o_player_turn
    print "Player O:"
    @o_player_choice = gets.chomp
    #Make sure that the player inputs a correct input
    if check_coord_marked?(@o_player_choice)
      print "Already marked please try again\n"
      self.o_player_turn
    elsif @coordinates.any?{|i| i==@o_player_choice}
      self.place_mark(@o_player_choice, "o")
    else
      print "Not a valid Coordinate try again \n"
      self.o_player_turn
    end
  end
  #method print_board rows of strings with positions printed to screen
  def print_board
    horizontal_rule = "   -------------"
    row_one = "     1   2   3 "
    row_two = " a | #{@array[0][0]} | #{@array[0][1]} | #{@array[0][2]} |"
    row_three = " b | #{@array[1][0]} | #{@array[1][1]} | #{@array[1][2]} |"
    row_four = " c | #{@array[2][0]} | #{@array[2][1]} | #{@array[2][2]} |"
    
    print row_one + "\n", row_two + "\n", horizontal_rule + "\n", 
    row_three + "\n", horizontal_rule + "\n", row_four  + "\n"
  end
  
  def three_of_kind?(type)
    if @array[0].all?{|i| i==type}
      true
    elsif @array[1].all?{|i| i==type}
      true
    elsif @array[2].all?{|i| i==type}
      true
    elsif @array[0][0] == type && @array[1][1] == type && @array[2][2] == type
      true
    elsif @array[0][2] == type && @array[1][1] == type && @array[2][0] == type
      true
    elsif @array[0][0] == type && @array[1][0] == type && @array[2][0] == type
      true
    elsif @array[0][1] == type && @array[1][1] == type && @array[2][1] == type
      true
    elsif @array[0][2] == type && @array[1][2] == type && @array[2][2] == type
      true
    else
      false
    end
  end

  def three_x?
    three_of_kind?("x")
  end

  def three_o?
    three_of_kind?("o")
  end

  #method play_game create loop until one player wins or no more moves left
  def play_game
    print "Welcome to Tic Tac Toe, a two player game where each player marks 
with a X or O in a 3x3 board until one player achieves a line of 3 marks. Each 
player should type the row letter + column number eg. a1  \n"
    print_board
    while  @turns<9 && self.three_o? == false && self.three_x? == false
      if @turn_type == "x"
        self.x_player_turn
        @turn_type = "o"
        @turns += 1
        self.print_board
      else
        self.o_player_turn
        @turn_type = "x"
        @turns += 1
        self.print_board
      end
    end
    if self.three_x?
      puts "Player X Wins" 
    elsif self.three_o?
      puts "Player O Wins"
    else
      puts "Tough luck it's a draw"
    end
  end
end

current_game = TicTacGame.new()
current_game.play_game