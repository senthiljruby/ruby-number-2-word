
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
  # @method test_number_to_word_without_0_or_1
  # @description Should compare the test value of output with the static test value.
  ###
  def test_number_to_word_3_combination_without_0_or_1
    @data_to_test = [
                      ["act", "amounts"], ["act", "boo", "tots"], ["act", "boo", "tour"], ["act", "boot", "mus"], ["act", "boot", "nus"], ["act", "boot", "our"],
                      ["act", "con", "tots"], ["act", "con", "tour"], ["act", "contour"], ["act", "coo", "tots"], ["act", "coo", "tour"], ["act", "coot", "mus"],
                      ["act", "coot", "nus"], ["act", "coot", "our"], ["acta", "mot", "mus"], ["acta", "mot", "nus"], ["acta", "mot", "our"], ["acta", "mounts"],
                      ["acta", "not", "mus"], ["acta", "not", "nus"], ["acta", "not", "our"], ["acta", "oot", "mus"], ["acta", "oot", "nus"], ["acta", "oot", "our"],
                      ["bat", "amounts"], ["bat", "boo", "tots"], ["bat", "boo", "tour"], ["bat", "boot", "mus"], ["bat", "boot", "nus"], ["bat", "boot", "our"],
                      ["bat", "con", "tots"], ["bat", "con", "tour"], ["bat", "contour"], ["bat", "coo", "tots"], ["bat", "coo", "tour"], ["bat", "coot", "mus"],
                      ["bat", "coot", "nus"], ["bat", "coot", "our"], ["cat", "boo", "tots"], ["cat", "boo", "tour"], ["cat", "boot", "mus"], ["cat", "boot", "nus"],
                      ["cat", "boot", "our"], ["cat", "con", "tots"], ["cat", "con", "tour"], ["cat", "contour"], ["cat", "coo", "tots"], ["cat", "coo", "tour"],
                      ["cat", "coot", "mus"], ["cat", "coot", "nus"], ["cat", "coot", "our"], "catamounts",
                    ]
    final_words = NumberToWord.new(2)
    combination_words = "2282668687"
    resulted_output = final_words.letter_combinations(combination_words)
    assert_equal(@data_to_test, resulted_output)
  end

  ###
  # @method test_number_to_word_with_length_2
  # @description Should compare the length of output with the static test value.
  ###
  def test_number_to_word_3_combination_with_length_2
    @data_to_test = [
                      ["act", "amounts"], ["act", "boo", "tots"], ["act", "boo", "tour"], ["act", "boot", "mus"], ["act", "boot", "nus"], ["act", "boot", "our"],
                      ["act", "con", "tots"], ["act", "con", "tour"], ["act", "contour"], ["act", "coo", "tots"], ["act", "coo", "tour"], ["act", "coot", "mus"],
                      ["act", "coot", "nus"], ["act", "coot", "our"], ["acta", "mot", "mus"], ["acta", "mot", "nus"], ["acta", "mot", "our"], ["acta", "mounts"],
                      ["acta", "not", "mus"], ["acta", "not", "nus"], ["acta", "not", "our"], ["acta", "oot", "mus"], ["acta", "oot", "nus"], ["acta", "oot", "our"],
                      ["bat", "amounts"], ["bat", "boo", "tots"], ["bat", "boo", "tour"], ["bat", "boot", "mus"], ["bat", "boot", "nus"], ["bat", "boot", "our"],
                      ["bat", "con", "tots"], ["bat", "con", "tour"], ["bat", "contour"], ["bat", "coo", "tots"], ["bat", "coo", "tour"], ["bat", "coot", "mus"],
                      ["bat", "coot", "nus"], ["bat", "coot", "our"], ["cat", "boo", "tots"], ["cat", "boo", "tour"], ["cat", "boot", "mus"], ["cat", "boot", "nus"],
                      ["cat", "boot", "our"], ["cat", "con", "tots"], ["cat", "con", "tour"], ["cat", "contour"], ["cat", "coo", "tots"], ["cat", "coo", "tour"],
                      ["cat", "coot", "mus"], ["cat", "coot", "nus"], ["cat", "coot", "our"], "catamounts",
                    ]
    final_words = NumberToWord.new(2)
    combination_words = "2282668687"
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
