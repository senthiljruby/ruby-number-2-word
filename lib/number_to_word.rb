require_relative "pre_manipulation_for_two_words.rb"

###
# @class NumberToWord
# @implements PreManipulationForWords
###
class NumberToWord
  def initialize
    @pre_manipulation_for_words = PreManipulationForWords.new
  end

  def letter_combinations(digits)
    @pre_manipulation_for_words.check_valid_number(digits)

    # Number to dialpad mapping
    letters = @pre_manipulation_for_words.instance_variable_get(:@number_key_mapping)

    # get all letters for numbers in form of array
    keys = digits.chars.map { |digit| letters[digit] }

    results = @pre_manipulation_for_words.manipulate_results_for_number(keys)

    #arrange words like we need as a output
    final_words = @pre_manipulation_for_words.arrange_words(results)

    # for all numbers
    dictionary_words = @pre_manipulation_for_words.instance_variable_get(:@dictionary)

    final_words << (keys.shift.product(*keys).map(&:join) & dictionary_words).join(", ") # match with all character
    final_words
  end
end

# 6686787825
# 2282668687
