class Ball
  require 'yaml'
  ANSWER = YAML.load_file(File.join(__dir__, './answers.yml'))
  def color(random2)
    case random2
    when 0..4
      31
    when 5..10
      33
    when 11..16
      32
    else 17..21
      36
  end
  end
  def shake
    random = rand(ANSWER.size) # random теперь у нас длина массива.
    puts "\e[#{color(random)}m#{ANSWER[random]}\e[0m" # сюда передали сначала метод колор random - это рандомное число масива
  end          # метод цифра             цифра массива
end
puts 'Привет, задай вопрос который тебя интересует!'
question = gets.chomp
word = Ball.new
word.shake
while question !='end'
    question = gets.chomp
    word.shake
end
