module Doggie
  WHATEVER = 10
  MAX = 100
  MIN = 0

  def initialize(pet_name)
    @famine = MAX
    @mood = MAX
    @pipi = MIN
    @asleep = false
    @energy = MAX
    @name = pet_name.capitalize
    puts @name + ' born'
  end

  def about
    puts 'Characteristics of your pet:'
    p "Famine = #{@famine}"
    p "Mood = #{@mood}"
    p "Stuff in intestine = #{@pipi}"
    p "Energy = #{@energy}"
    puts ' '
  end

  def feed
    puts 'You feed ' + @name + ' she is eating with pleasure'
    @famine += rand(WHATEVER)
    @energy -= rand(WHATEVER)
    @pipi += rand(WHATEVER)
    time
    balance
  end

  def living?
    @energy > 0
  end

  def go_for_a_walk
    puts 'You go for a walk with ' + @name
    @famine -= rand(WHATEVER)
    @mood += rand(WHATEVER)
    @pipi = MIN
    @energy -= rand(WHATEVER)
    time
    balance
  end

  def play
    puts "You are playing with #{@name} she looks so happy!"
    @mood += rand(WHATEVER)
    @famine -= rand(WHATEVER)
    @energy -= rand(WHATEVER)
    time
    balance
  end

  def running
    puts 'You go for a running with your dog'
    @mood += rand(WHATEVER)
    @famine-=rand(WHATEVER)
    @energy -= rand(WHATEVER)
  end

  def puts_to_bed
    puts 'You try puts to bed your doggie'
    @asleep = true
    @energy += rand(WHATEVER)
    @famine -= rand(WHATEVER)
    @pipi += rand(WHATEVER)
    time
  end

  def punish
    puts "You punish #{@name} she is crying"
    @mood -= rand(WHATEVER)
    @pipi += rand(WHATEVER)
    time
  end

  private

  def balance
    @famine = rand(70..90) if @famine >= 100
    @mood = rand(70..90) if @mood >= 100
    @energy = rand(70..90) if @energy >= 100
  end

  def hungry?
    if @famine < 40
      if @asleep
        @asleep = false
      puts "#{@name} doesn't want to sleep, she is hungry!"
      end
    end
  end

  def time
    puts "#{@name} want to eat!" if @famine <= 40
    puts "#{@name} does the potty dance " if @pipi >= 30
    puts "#{@name} very tired she want's to sleep" if @energy <= 50
    puts ' '
    hungry?
    if @famine <= 30
      puts 'Your dog is leaving you!'
      exit
    end
  end

class Dog
  include Doggie
end
test = Dog.new
end
