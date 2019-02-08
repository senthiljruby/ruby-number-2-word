
require_relative "../lib/number_to_word"
require "test/unit"

class TestNumberToWord < Test::Unit::TestCase
  def test_number_to_word_without_0_or_1
    final_words = NumberToWord.new()
    combination_words = "8686782825"
    assert_equal([["unto", "statal"], ""], final_words.letter_combinations(combination_words))
  end

  def test_number_to_word_with_length_2
    final_words = NumberToWord.new()
    combination_words = "8686782825"
    assert_equal(2, final_words.letter_combinations(combination_words).length)
  end

  def test_number_to_word_with_0_or_1
    final_words = NumberToWord.new()
    combination_words = "2686701825"
    assert_equal([], final_words.letter_combinations(combination_words))
  end
end
