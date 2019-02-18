#!/usr/bin/env ruby

require "./lib/number_to_word.rb"
require "colorize"

final_words = NumberToWord.new()
print "Enter the number to check the letter combinations :: "
combination_words = STDIN.gets().chomp

begin
  final_word_combinations = final_words.letter_combinations(combination_words)
  puts "----------------------------------".yellow
  puts "  Total Combination Found :: #{final_word_combinations.flatten.length}".yellow
  puts "----------------------------------".yellow
  puts final_word_combinations.to_s.green
rescue RuntimeError
  print "The number you have entered is not a valid number. Please try again.".red
end
puts
