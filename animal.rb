module Actions
  MAX_VALUE = 100
  MIN_VALUE = 0
  VALUE_CHNG = 7
  def feed
    puts "Вы покормили #{@name}"
    @value[:satiety] = MAX_VALUE
    @value[:mood] += rand(VALUE_CHNG)
    @value[:stuff_intestine] += rand(VALUE_CHNG)
    about_pet
  end

  def walk
    @value[:stuff_intestine] = MIN_VALUE
    @value[:mood] += rand(VALUE_CHNG)
    @value[:pollution] += rand(VALUE_CHNG)
    @value[:satiety] -= rand(VALUE_CHNG)
    @value[:cheerful] -= rand(VALUE_CHNG)
    about_pet
  end

  def about_pet
    correct_value
    puts "\e[32m
    Радость            = #{@value[:mood]}%
    Здоровья           = #{@value[:health]}%
    Бодрость           = #{@value[:cheerful]}%
    Злость             = #{@value[:anger]}%
    Сытость            = #{@value[:satiety]}%
    Загрязнонность     = #{@value[:pollution]}%
    Постебность гулять = #{@value[:stuff_intestine]}%\e[0m"
  end

  def bathing
    puts "Вы покупали #{@name}. Теперь он чистый"
    @value[:pollution] = MIN_VALUE
    @value[:mood] += rand(VALUE_CHNG)
    about_pet
  end

  def pat_the_belly
    puts 'Вы гладите живот вашему ёжику. От радости он аж улыбается.'
    @value[:anger] -= rand(VALUE_CHNG)
    @value[:mood] += rand(VALUE_CHNG)
    about_pet
  end

  def kick
    puts 'Не бейте вашего ёжика'
    @value[:health] -= rand(VALUE_CHNG) * 2
    @value[:anger] += rand(VALUE_CHNG) * 2
    @value[:mood] -= rand(VALUE_CHNG)
    about_pet
  end

  def sleep
    time = rand(5)
    puts "#{@name} спит #{time} часов."
    time.times do
      @value[:satiety] -= rand(VALUE_CHNG)
      @value[:health] += rand(VALUE_CHNG)
      @value[:cheerful] += rand(VALUE_CHNG)
      puts "#{@name} нежно подхрапивает в такт соседям."
    end
    puts "#{@name} выспался."
    about_pet
  end

  def kill
    puts "\e[31mВы бездушная тварь. Вы убили своего ёжика. Игра окончена\e[0m"
    exit
  end

  def toss
    puts "Вы подбрасываете #{@name} в воздух "
    puts 'Он хихикает и стреляет своими  маленькими иголочками'
    @value[:anger] -= rand(VALUE_CHNG)
    @value[:mood] += rand(VALUE_CHNG)
    about_pet
  end

  def help
    puts "\e[33m
    feed      - покормить
    walk      - погулять
    toss      - подбросить
    sleep     - уложить спать
    bathing   - покупать
    kick      - ударить
    patBelly  - погладить живот
    kill      - убить\n\e[0m"
  end
end

class Pet
  include Actions
  MAX_VALUE = 100
  MIN_VALUE = 0
  VALUE_CHNG = 7
  def initialize
    puts 'Введите имя ёжика'
    @name = gets.chomp
    puts "\nУ Вас появился ёжик. Его зовут #{@name}."
    @asleep = false
    @value = { health: MAX_VALUE, mood: MAX_VALUE,
               satiety: MAX_VALUE, cheerful: MAX_VALUE, anger: MIN_VALUE,
               pollution: MIN_VALUE, stuff_intestine: MIN_VALUE }
    about_pet
  end

  private

  def correct_min
    @value.each_key { |key| @value[key] = MIN_VALUE if @value[key] < MIN_VALUE }
    after_correct_min
  end

  def after_correct_min
    if @value[:health] == MIN_VALUE ||
       @value[:cheerful] == MIN_VALUE ||
       @value[:satiety] == MIN_VALUE
      puts "\e[31m#{@name} заболел и умер\e[0m"
      exit
    elsif @value[:mood] == MIN_VALUE
      puts "\e[31m#{@name} скучно с Вами. Он убежал от Вас.\e[0m"
      exit
    end
  end

  def correct_max
    @value.each_key { |key| @value[key] = MAX_VALUE if @value[key] > MAX_VALUE }
    after_correct_max
  end

  def after_correct_max
    if @value[:anger] == MAX_VALUE || @value[:pollution] == MAX_VALUE
      puts "\e[31m#{@name} убежал, ибо Вы его разозлили или не помыли\e[0m"
      exit
    elsif @value[:stuff_intestine] == MAX_VALUE
      puts "\e[31mУпс..#{@name} наделал гадостей\e[0m"
      @value[:stuff_intestine] = MIN_VALUE
    end
  end

  def correct_value
    correct_max
    correct_min
  end
end

pet = Pet.new
puts "
  \e[33mhelp - что бы посмотреть все команды
  exit - что бы завершить игру\e[0m"

command = ''
until command == 'exit'
  case command = gets.chomp
  when 'help'
    pet.help
  when 'feed'
    pet.feed
  when 'walk'
    pet.walk
  when 'toss'
    pet.toss
  when 'sleep'
    pet.sleep
  when 'patBelly'
    pet.pat_the_belly
  when 'kick'
    pet.kick
  when 'bathing'
    pet.bathing
  when 'kill'
    pet.kill
  when 'exit'
    exit
  else
    puts 'Введите команду правильно'
  end
end
