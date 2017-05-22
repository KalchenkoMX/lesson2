module Tamagochi
  def play
  puts 'Enter a name for your pet'
  pet_name = gets.chomp
  pet = Dog.new(pet_name)
    while pet.living?
      puts 'ALL COMMANDS:'
      puts '1 - to feed 2 - to go_for_a_walk'
      puts '3 - to play 4 - to puts_to_bed'
      puts '5 - to puninish 6 - info'
      puts '7 - to running 8 - to exit'
      case choise = gets.chomp.to_i
      when 1
        pet.feed
      when 2
        pet.go_for_a_walk
      when 3
        pet.play
      when 4
        pet.puts_to_bed
      when 5
        pet.punish
      when 6
        pet.about
      when 7
        pet.running
      when 8
        exit
      else
        puts 'retry'
      end
    end
  end
end
