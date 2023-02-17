class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |letter, i| indices << i if char == letter }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if get_matching_indices(char) == []
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char))
    end

    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses <= 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if (win? || lose?)
      p @secret_word
      return true
    else
      return false
    end
  end

end
