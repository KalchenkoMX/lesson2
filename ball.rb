require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, 'answers.yml'))

  def colorize(random)
    case random
    when 0..4
      31
    when 5..9
      32
    when 10..14
      33
    when 15..19
      34
    end
  end

  def shake
    random = rand(ANSWERS.size)
    puts "\e[#{colorize(random)}m#{ANSWERS[random]}\e[0m"
    ANSWERS[random]
  end
end
