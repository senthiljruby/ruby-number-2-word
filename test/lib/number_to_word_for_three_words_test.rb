
require_relative "../../lib/number_to_word"
require_relative "../../lib/pre_manipulation_to_word_all_combinations"

require "test/unit"

class TestNumberToWordFor3Word < Test::Unit::TestCase
  def setup
    @pre_manipulation_for_words = PreManipulationForAllCombinationWords.new
  end

  def test_letter_combinations
    combination_words = "8686782825"
    final_words = NumberToWord.new(2)
    results = [["tot", "opt", "buck"],
               ["tot", "ort", "buck"],
               ["unto", "statal"],
               ["unto", "pub", "taj"],
               ["unto", "qua", "taj"],
               ["unto", "rub", "taj"],
               ["unto", "sub", "taj"]]
    assert_equal(results, final_words.letter_combinations(combination_words))
  end

  def test_manipulate_results_for_number
    final_words = NumberToWord.new(2)
    input_words = "2282668687"
    keys = {
      2 => ["aa", "ab", "ba"],
      3 => ["act", "bat", "cat"],
      5 => [],
      6 => [],
      4 => ["acta"],
      8 => [],
      9 => ["catamount"],
      10 => ["catamounts"],
      7 => [],
      11 => ["catamounts"],
      12 => ["catamounts"],
      13 => ["catamounts"],
      14 => ["catamounts"],
      15 => ["catamounts"],
    }
    assert_equal(52, @pre_manipulation_for_words.manipulate_results_for_number(input_words, keys).length)
  end

  def test_arrange_words
    final_words = NumberToWord.new(2)
    keys = "8686782825"
    assert_equal([], @pre_manipulation_for_words.arrange_words(keys))
  end
end
