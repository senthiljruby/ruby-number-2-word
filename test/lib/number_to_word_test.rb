
require_relative "../../lib/number_to_word"
require "test/unit"

class TestNumberToWord < Test::Unit::TestCase
  def test_letter_combinations
    final_words = NumberToWord.new()
    combination_words = "8686782825"
    assert_equal([["unto", "statal"], ""], final_words.letter_combinations(combination_words))
  end

  def test_parameter_error
    assert_raise(ArgumentError) { NumberToWord.new("a") }
  end
end
