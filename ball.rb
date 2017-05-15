require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, './answers.yml'))
  def color(index)
    case index
    when 0..4
      31
    when 5..9
      33
    when 10..14
      32
    else
      36
    end
  end

  def shake
    random = rand(ANSWERS.size)
    puts "\e[#{color(random)}m#{ANSWERS[random]}\e[0m"
    ANSWERS[random]
  end
end
puts 'Привет, задай вопрос который тебя интересует!'
question = gets.chomp

ball = Ball.new
while question != 'end'
  ball.shake
  question = gets.chomp
end
