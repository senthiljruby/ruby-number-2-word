require "benchmark"
require "./lib/number_to_word.rb"

puts "Single Bench mark report for Number2word::"
Benchmark.bm do |b|
  GC.start
  b.report("Number2word") do
    final_words = NumberToWord.new()
    final_words.letter_combinations(rand(1000000000..9999999999))
  end
  GC.start
end

puts "Bench mark report for Number2word:: (100)"

generateRandomNumber = Array.new(100) { rand(1000000000..9999999999) }

Benchmark.bm do |b|
  GC.start
  b.report("Number2word") do
    (generateRandomNumber).each do |i|
      final_words = NumberToWord.new()
      final_words.letter_combinations(i)
    end
  end
  GC.start
end
