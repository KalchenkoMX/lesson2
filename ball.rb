require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, 'answers.yml'))
  RED_COLOR = 31
  GREEN_COLOR = 32
  YELLOW_COLOR = 33
  BLUE_COLOR = 34

  def colorize(random)
    case random
    when 0..4
      RED_COLOR
    when 5..9
      GREEN_COLOR
    when 10..14
      YELLOW_COLOR
    when 15..19
      BLUE_COLOR
    end
  end

  def shake
    random = rand(ANSWERS.size)
    puts "\e[#{colorize(random)}m#{ANSWERS[random]}\e[0m"
    ANSWERS[random]
  end
end
