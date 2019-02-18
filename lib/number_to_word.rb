require_relative "pre_manipulation_for_two_words.rb"
require_relative "pre_manipulation_to_word_all_combinations.rb"

###
# @class NumberToWord
# @implements PreManipulationForWords
###
class NumberToWord
  def initialize(options = 1)
    @options = options
    @pre_manipulation_for_words = PreManipulationForWords.new
    @pre_manipulation_for_all_combination_words = PreManipulationForAllCombinationWords.new
  end

  def letter_combinations(digits)
    #number to letters mapping
    letters = @pre_manipulation_for_words.instance_variable_get(:@number_key_mapping)
    @pre_manipulation_for_words.check_valid_number(digits)
    matching_words = {}

    if (@options == 1)
      # for all numbers
      dictionary_words = @pre_manipulation_for_words.instance_variable_get(:@dictionary)

      # get all letters for numbers in form of array
      keys = digits.chars.map { |digit| letters[digit] }

      results = @pre_manipulation_for_words.manipulate_results_for_number(keys)

      #arrange words like we need as a output
      final_words = @pre_manipulation_for_words.arrange_words(results)

      final_words << (keys.shift.product(*keys).map(&:join) & dictionary_words).join(", ") # match with all character
    else
      dictionary_words = @pre_manipulation_for_all_combination_words.instance_variable_get(:@dictionary)

      dictionary_words.keys.each do |key|
        matching_words[key] = @pre_manipulation_for_all_combination_words.arrange_words(digits[0..(key - 1)])
      end

      final_words = @pre_manipulation_for_all_combination_words.manipulate_results_for_number(digits, matching_words)
    end
    final_words
  end
end
