require "benchmark"
require "./lib/number_to_word.rb"

puts "=========================================="
puts "Single Bench mark report for Number2word::"
puts "=========================================="

Benchmark.bm do |b|
  GC.start
  b.report("Number2word") do
    final_words = NumberToWord.new()
    final_words.letter_combinations(rand(1000000000..9999999999).to_s)
  end
  GC.start
end

puts
puts "=========================================="
puts "Bench mark report for Number2word:: (100) "
puts "=========================================="

generateRandomNumber = Array.new(100) { rand(1000000000..9999999999) }

Benchmark.bm do |b|
  GC.start
  b.report("Number2word") do
    (generateRandomNumber).each do |i|
      final_words = NumberToWord.new()
      final_words.letter_combinations(i.to_s)
    end
  end
  GC.start
end
