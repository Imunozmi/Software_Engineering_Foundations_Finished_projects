class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize 
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  #getters
  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  #others
  def already_attempted? (char)
    @attempted_chars.include? char
  end

  def get_matching_indices (char)
    indices = []
    @secret_word.each_char.with_index { |ch, idx| indices << idx if ch == char }
    indices
  end

  def fill_indices (char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end

  def try_guess (char)
    if already_attempted?(char)
      print "that has already been attempted"
      false
    else
      @attempted_chars << char
      matches = get_matching_indices(char)
      if matches.empty?
        @remaining_incorrect_guesses -= 1 
      else
        fill_indices(char, matches)
      end
      true
    end
  end

  def ask_user_for_guess
    print "Enter a char:"
    attempt = gets.chomp
    try_guess(attempt)
  end

  def win?
    if @guess_word.join() == @secret_word
      print "WIN"
      true
    else
      false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      print "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      print @secret_word
      true
    else
      false
    end
  end

end
