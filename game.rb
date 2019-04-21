#!/usr/bin/ruby -Ku

lines = File.readlines("list_of_words.txt", :encoding => 'UTF-8')
max_index_words = lines.size - 1
score = 0
num_of_question = lines.size > 5 ? 5 : lines.size

questions = []
(1..num_of_question).each do |index|
  question = lines.sample
  questions << question.gsub("\n", "")
  lines -= [question]
end

puts "Terdapat #{num_of_question} pertanyaan."
max_attempt = 2
questions.each_with_index do |question, index|
  puts "Tebak kata: " + question.chars.shuffle.join

  puts "Jawab: "
  answer = gets.chomp

  correct = answer == question
  while !correct
    max_attempt -= 1

    if max_attempt != 0
      puts "SALAH! Silakan coba lagi. "
      puts "Jawab: "
      answer  = gets.chomp
      correct = answer == question
    else
      max_attempt = 2

      if index != questions.size - 1
        puts "Anda salah #{max_attempt} x. Lanjut ke pertanyaan berikutnya"
      else
        puts "Anda salah #{max_attempt} x. Permainan berakhir"
      end

      break
    end
  end

  if correct
    score += 1
    puts "BENAR point anda : #{score}"
    max_attempt = 2
  end
end

puts "Terima kasih sudah bermain. Score anda: #{score}"
