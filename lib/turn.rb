def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
    number = index.to_i
    return number - 1
end

def move(board, pos, character = "X")
    board[pos] = character
end

def valid_move?(board, index)
    if (position_taken?(board, index) == false) && (index.between?(0,8))
        true
    elsif (position_taken?(board, index) == true) && (index.between?(0,8) == false)
        false
    end
end

def position_taken?(board, index)
    if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
        false
    elsif (board[index] == "X") || (board[index] == "O")
        true
    end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    number = input_to_index(input)
    until valid_move?(board, number) == true
        puts "invalid"
        input = gets.strip
        number = input_to_index(input)
    end
    move(board, number)
    display_board(board)
end