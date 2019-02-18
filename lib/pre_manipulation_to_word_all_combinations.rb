require "json"

class PreManipulationForAllCombinationWords
  ###
  # @class PreManipulationForAllCombinationWords
  # @description Creates an instance of PreManipulationForAllCombinationWords.
  ###
  def initialize
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

    # Hashing the values based on the word length
    @dictionary = []
    file_path = "db/dictionary.txt"

    File.foreach(file_path) do |word|
      @dictionary.push word.chop.to_s.downcase
    end

    @dictionary = @dictionary.group_by { |x| x.to_s.length }
  end

  ###
  # @method manipulate_results_for_number
  # @params keys
  # @params results
  # @description Manipulate the results for first and second combination.
  ###
  def manipulate_results_for_number(digits, results = {})
    final_array = []
    results.map do |key, value|
      unless value.empty?
        remaining_length = 10 - key.to_i
        if remaining_length >= 3
          comp_words = arrange_words(digits[(key.to_i)..9])
          unless comp_words.empty?
            value.each do |f_w|
              comp_words.map { |c| final_array.push([f_w, c]) }
            end
          end
          if remaining_length == 6
            s_comp_words = arrange_words(digits[4..6])
            unless s_comp_words.empty?
              t_comp_words = arrange_words(digits[7..9])
              unless t_comp_words.empty?
                value.each do |f_w|
                  s_comp_words.each do |s|
                    t_comp_words.map { |t| final_array.push([f_w, s, t]) }
                  end
                end
              end
            end
          elsif remaining_length == 7
            [3, 4].each do |y|
              s_comp_words = arrange_words(digits[3..(2 + y)])
              unless s_comp_words.empty?
                t_comp_words = arrange_words(digits[(2 + y + 1)..9])
                unless t_comp_words.empty?
                  value.each do |f_w|
                    s_comp_words.each do |s|
                      t_comp_words.map { |t| final_array.push([f_w, s, t]) }
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    unless results[10].empty?
      final_array.map { |f| final_array.delete(f) if (results[10].include?(f.join("")) && f.class.name == "Array") }
      final_array = final_array.uniq.sort
      results[10].sort.map { |result| final_array.push(result) }
    end

    final_array
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
    @dictionary[results.length].each do |combo_words|
      matchedFlag = true
      splitted_combo_words = combo_words.chars
      splitted_combo_words.map.with_index do |value, key|
        unless @number_key_mapping[results[key]].include?(value)
          matchedFlag = false
          break
        end
      end

      # splitted_combo_words.product
      if matchedFlag == true
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
    self.check_valid_number(digits)

    #number to letters mapping
    letters = @number_key_mapping

    matching_words = {}

    @dictionary.keys.each do |key|
      matching_words[key] = self.arrange_words(digits[0..(key - 1)])
    end

    results = self.manipulate_results_for_number(digits, matching_words)
    results
  end
end
