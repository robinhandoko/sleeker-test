#!/usr/bin/ruby -Ku
manifest = File.open("list_of_words.txt", "a:UTF-8")

puts "Please enter any word"
word = gets.chomp
manifest.write(word + "\n")

puts "You want to create a new word ? Y/N"
new_word = gets.chomp

while new_word != "N"
  case new_word
  when "N"
    break
  when "Y"
    puts "Please enter any word"
    word = gets.chomp
    manifest.write(word + "\n")
  else
    puts "The answer should be Y or N"
  end

  puts "You want to create a new word ? Y/N"
  new_word = gets.chomp
end

manifest.close rescue nil
puts "Thanks"
