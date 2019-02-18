#!/usr/bin/env ruby

require "./lib/number_to_word.rb"
require "colorize"

puts "################################################".magenta
puts "Choose the option for finding the combination:".magenta
puts "1 => Find 2 Word Combination".magenta
puts "2 => Find all word combination".magenta
puts "Press any other key to exit the app".magenta
puts "################################################".magenta

get_combinations = STDIN.gets().chomp

case get_combinations.to_i
when 1
  puts "You have choosed 2 Word combination".green
  final_words = NumberToWord.new(get_combinations.to_i)
when 2
  puts "You have choosed all word combination".green
  final_words = NumberToWord.new(get_combinations.to_i)
else
  puts "You gave me #{get_combinations} -- I have no idea what to do with that.".red
  exit(true)
end

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
