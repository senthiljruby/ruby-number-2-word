
require_relative "../../lib/number_to_word"
require "test/unit"

class TestNumberToWord < Test::Unit::TestCase
  def test_letter_combinations
    combination_words = "8686782825"
    final_words = NumberToWord.new()
    assert_equal([["unto", "statal"], ""], final_words.letter_combinations(combination_words))
  end

  def test_parameter_error
    assert_raise(ArgumentError) { NumberToWord.new("a") }
  end

  def test_manipulate_results_for_number
    final_words = NumberToWord.new()
    keys = [
      ["t", "u", "v"],
      ["m", "n", "o"],
      ["t", "u", "v"],
      ["m", "n", "o"],
      ["p", "q", "r", "s"],
      ["t", "u", "v"],
      ["a", "b", "c"],
      ["t", "u", "v"],
      ["a", "b", "c"],
      ["j", "k", "l"],
    ]
    assert_equal(5, final_words.manipulate_results_for_number(keys).length)
  end

  def test_arrange_words
    final_words = NumberToWord.new()
    results = {2 => [["tot"], []], 3 => [["unto"], ["statal"]], 4 => [[], []], 5 => [[], ["buck"]], 6 => [[], ["taj"]]}
    assert_equal([["unto", "statal"]], final_words.arrange_words(results))
  end
end
