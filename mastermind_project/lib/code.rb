class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs? (chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize (chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "invalid pegs"
    end
  end

  def length
    @pegs.length
  end

  def self.random (num)
    arr = []
    num.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)   
  end

  def self.from_string (str)
    Code.new(str.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def num_exact_matches (guess)
    correct = 0

    guess.length.times do |idx|
      correct += 1 if guess[idx] == @pegs[idx]
    end

    correct
  end

  def num_near_matches (guess)
    near = 0

    guess.length.times do |idx|
      if @pegs.include?(guess[idx]) && guess[idx] != @pegs[idx]
        near += 1
      end
    end

    near
  end

  def ==(inst)
    self.pegs == inst.pegs
  end

end
