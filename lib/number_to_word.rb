require "json"

class PreManipulationForWords
  ###
  # @class PreManipulationForWords
  # @description Creates an instance of PreManipulationForWords.
  ###
  def initialize
    # @numberToLetterMap = JSON.parse(File.read("config/words_number.json")) # Removed it to make the performance of the calculation
    @number_key_mapping = {
      "2" => %w[a b c],
      "3" => %w[d e f],
      "4" => %w[g h i],
      "5" => %w[j k l],
      "6" => %w[m n o],
      "7" => %w[p q r s],
      "8" => %w[t u v],
      "9" => %w[w x y z],
    }
    @dictionary = []
    file_path = "db/dictionary.txt"

    File.foreach(file_path) do |word|
      @dictionary.push word.chop.to_s.downcase
    end
  end

  ###
  # @method manipulate_results_for_number
  # @params keys
  # @params results
  # @description Manipulate the results for first and second combination.
  ###
  def manipulate_results_for_number(keys, results = {})
    total_number = keys.length - 1

    (2..total_number).each do |i|
      first_array = keys[0..i]
      second_array = keys[i + 1..total_number]
      next if first_array.length < 3 || second_array.length < 3
      first_combination = first_array.shift.product(*first_array).map(&:join)
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)

      next if second_combination.nil?
      results[i] = [(first_combination & @dictionary), (second_combination & @dictionary)]
    end
    results
  end

  ###
  # @method check_valid_number
  # @params number
  # @description Finds the input value is valid or not (Checks the numbers and its number length is greater than 10)
  ###
  def check_valid_number(number)
    unless (number.length == 10 && number.match(/^[2-9]*$/))
      raise "The given number is not valid. Please try again"
    end
  end

  ###
  # @method arrange_words
  # @params results
  # @description Arrange the results with the array format to display as a final words.
  ###
  def arrange_words(results)
    final_words = []
    results.each do |key, combinations|
      next if combinations.first.nil? || combinations.last.nil?
      combinations.first.product(combinations.last).each do |combo_words|
        final_words << combo_words
      end
    end
    final_words
  end
end

###
# @class NumberToWord
# @implements PreManipulationForWords
###
class NumberToWord < PreManipulationForWords
  def letter_combinations(digits)

    #return if number not valid
    # return [] if digits.nil? || digits.size != 10 || digits.split("").select { |a| (a.to_i == 0 || a.to_i == 1) }.length > 0
    self.check_valid_number(digits)

    #number to letters mapping
    letters = @number_key_mapping

    # get all letters for numbers in form of array
    keys = digits.chars.map { |digit| letters[digit] }

    results = self.manipulate_results_for_number(keys)

    #arrange words like we need as a output
    final_words = self.arrange_words(results)

    # for all numbers
    final_words << (keys.shift.product(*keys).map(&:join) & @dictionary).join(", ") # match with all character
    final_words
  end
end
