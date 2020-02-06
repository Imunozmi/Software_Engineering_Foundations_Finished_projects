
require './board.rb'
require './human_player.rb'

class Game

    def initialize(board_size, *player_marks_arr)
        @players = player_marks_arr.map { |mrk| HumanPlayer.new(mrk) }
        @board = Board.new(board_size)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play

        while @board.empty_positions?
            mark = @current_player.mark_value

            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, mark)

            if @board.win?(mark)
                p @board.print
                p "CONGRATULATIONS PLAYER " + mark.to_s + " YOU HAVE WON THE GAME!"
                return
            else
                self.switch_turn
            end
        end

        @board.print
        p "IT'S A DRAW!"
    end
end