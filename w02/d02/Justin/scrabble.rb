# ###Scrabble


# #### To Do

# * Define a class named ScrabbleWord. It's initializer takes one parameter: `word` and stores it in an instance variable. Write a "getter" for this instance variable 
# that returns the word as a lowercase string.
class ScrabbleWord
  def initialize (word)
    @word = word
    @score = 0
  end

# * Define a CONSTANT hash for your class called TILE_VALUES. Here is the hash:
TILE_VALUES = {
  "a"=>1, "b"=>3, "c"=>3, "d"=>2, "e"=>1,
  "f"=>4, "g"=>2, "h"=>4, "i"=>1, "j"=>8,
  "k"=>5, "l"=>1, "m"=>3, "n"=>1, "o"=>1,
  "p"=>3, "q"=>10, "r"=>1, "s"=>1, "t"=>1,
  "u"=>1, "v"=>4, "w"=>4, "x"=>8, "y"=>4,
  "z"=>10
}

# 1. `s.word` returns the word stored in the instance variable and formats it using lowercase letters.
  def word
    @word.downcase
  end

# 2. `s.to_array` returns an array with each character in the word string being an item in the array
  def to_array
    word.to_array  
  end

# 3. `s.char_at` takes an index as a parameter and returns the character in the word string at that index
  def char_at(index)
    self.to_array.[index.to_i]
  end

# 4. `s.score` returns the scrabble score of the word. The values for each letter are listed in the TILE_VALUES hash.
  def score
    # @word_score = 0
    # @word_score = @word_score + 
    @word.to_array.each { |character| TILE_VAULES[character] }
  end
  
  # 5. `s.multiplier_score` takes a multiplier as a parameter and returns a multiplied value of the score. (Think double or triple word score.)
  def multiplier_score(x)
    self.score * x
  end
end



s = ScrabbleWord.new("konowitch")
s.word


# * The class should respond to the following method calls (for an ScrabbleWord object `s`):

# `s.to_array`, `s.char_at`, `s.score`, and `s.multiplier_score`

# 1. Make all of the methods *stubs*: ie they do nothing.
# 2. `s.char_at` and `s.multiplier_score` each take **one** parameter/argument; the rest take none.

# * Write procedures for your class, such that:

# * Check your work on the scrabble word "konowitch". It scores 21 points.

# #### For fun

# Given this hash again:

# ```ruby
# {
#   "a"=>1, "b"=>3, "c"=>3, "d"=>2, "e"=>1,
#   "f"=>4, "g"=>2, "h"=>4, "i"=>1, "j"=>8,
#   "k"=>5, "l"=>1, "m"=>3, "n"=>1, "o"=>1,
#   "p"=>3, "q"=>10, "r"=>1, "s"=>1, "t"=>1,
#   "u"=>1, "v"=>4, "w"=>4, "x"=>8, "y"=>4,
#   "z"=>10
# }
# ```

# * How would you return a hash with just the key value pairs where the score of the letter is 4?
# * Given an array like `letter_array = ["c","h","a","i","r"]`, how could I get back an array with the scores of each letter individually? Like `[3,4,1,1,1]`
