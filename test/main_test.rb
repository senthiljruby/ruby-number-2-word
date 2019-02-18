
require_relative "../lib/number_to_word"
require "test/unit"

class TestNumberToWord < Test::Unit::TestCase
  ###
  # @method test_number_to_word_without_0_or_1
  # @description Should compare the test value of output with the static test value.
  ###
  def test_number_to_word_without_0_or_1
    @data_to_test = [["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]

    final_words = NumberToWord.new()
    combination_words = "6686787825"
    resulted_output = final_words.letter_combinations(combination_words)
    assert_equal(@data_to_test, resulted_output)
    # assert_equal(@data_to_test, final_words.letter_combinations(combination_words))
  end

  ###
  # @method test_number_to_word_with_length_2
  # @description Should compare the length of output with the static test value.
  ###
  def test_number_to_word_with_length_2
    @data_to_test = [["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]

    final_words = NumberToWord.new()
    combination_words = "6686787825"
    resulted_output = final_words.letter_combinations(combination_words)
    assert_equal(@data_to_test.length, resulted_output.length)
  end

  ###
  # @method test_number_to_word_with_0_or_1
  # @description Should throw error when 0 or 1 is passed
  ###
  def test_number_to_word_with_0_or_1
    final_words = NumberToWord.new()
    combination_words = "2686701825"
    assert_raises RuntimeError do
      final_words.letter_combinations(combination_words)
    end
  end

  ###
  # @method test_number_to_word_by_passing_character
  # @description Should throw error when characters is passed
  ###
  def test_number_to_word_by_passing_character
    final_words = NumberToWord.new()
    combination_words = "abceded"
    assert_raises RuntimeError do
      final_words.letter_combinations(combination_words)
    end
  end

  ###
  # @method test_number_to_word_by_length_of_input_greater_than_10
  # @description Should throw error when input is greater than 10 is passed
  ###
  def test_number_to_word_by_length_of_input_greater_than_10
    final_words = NumberToWord.new()
    combination_words = "26867018251"
    assert_raises RuntimeError do
      final_words.letter_combinations(combination_words)
    end
  end
end
