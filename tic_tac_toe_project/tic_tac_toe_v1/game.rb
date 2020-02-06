
require './board.rb'
require './human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new(3)
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play

        while @board.empty_positions?
            mark = @current_player.mark_value

            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, mark)

            if @board.win?(mark)
                p "CONGRATULATIONS PLAYER " + mark.to_s + " YOU HAVE WON THE GAME!"
                p @board.print
                return
            else
                self.switch_turn
            end
        end

        @board.print
        p "IT'S A DRAW!"
    end
end