require "json"

class PreManipulationForWords
  def initialize
    @numberToLetterMap = JSON.parse(File.read("config/words_number.json"))
    # Read dictionary file and hold all values in a array
    @dictionary = []
    file_path = "db/dictionary.txt"

    File.foreach(file_path) do |word|
      @dictionary.push word.chop.to_s.downcase
    end
  end

  def manipulate_results_for_number(keys, results = {})
    total_number = keys.length - 1 # total numbers

    #Loo through all letters and get matching records with dictionary
    (2..total_number).each do |i|
      first_array = keys[0..i]
      second_array = keys[i + 1..total_number]
      next if first_array.length < 3 || second_array.length < 3
      first_combination = first_array.shift.product(*first_array).map(&:join) # Get product of arrays
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      results[i] = [(first_combination & @dictionary), (second_combination & @dictionary)] # get common values from arrays
    end
    results
  end

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

class NumberToWord < PreManipulationForWords
  def letter_combinations(digits)
    #return if number not valid
    return [] if digits.nil? || digits.size != 10 || digits.split("").select { |a| (a.to_i == 0 || a.to_i == 1) }.length > 0

    #number to letters mapping
    letters = @numberToLetterMap

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
