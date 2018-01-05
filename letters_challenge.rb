require 'colorize'
require 'pry'

# Numbers from http://www.theasciicode.com.ar/
# upLetters = [
#   {'A' => 65}, {'B' => 66}, {'C' => 67}, {'D' => 68},
#   {'E' => 69}, {'F' => 70}, {'G' => 71}, {'H' => 72},
#   {'I' => 73}, {'J' => 74}, {'K' => 75}, {'L' => 76},
#   {'M' => 77}, {'N' => 78}, {'O' => 79}, {'P' => 80},
#   {'Q' => 81}, {'R' => 82}, {'S' => 83}, {'T' => 84},
#   {'U' => 85}, {'V' => 86}, {'W' => 87}, {'X' => 88},
#   {'Y' => 89}, {'Z' => 90}
# ]

# lowLetters = [
#   {'a' => 97}, {'b' => 98}, {'c' => 99}, {'d' => 100},
#   {'e' => 101}, {'f' => 102}, {'g' => 103}, {'h' => 104},
#   {'i' => 105}, {'j' => 106}, {'i' => 107}, {'l' => 108},
#   {'m' => 109}, {'n' => 110}, {'p' => 111}, {'p' => 112},
#   {'q' => 113}, {'r' => 114}, {'s' => 115}, {'t' => 116},
#   {'u' => 117}, {'v' => 118}, {'w' => 119}, {'x' => 120},
#   {'y' => 121}, {'z' => 122}
# ]


def post_input
  @input.each do | x |
    print "#{x.ord} ".light_blue
  end
  puts "\n\n"
end


def post_asc
  puts 'Post Ascending'
  asc_input = @input.sort_by {|k, v| v}
  asc_input.each do | x |
    print "#{x.ord} ".green
  end
  puts "\n\n"
end


def post_desc
  puts 'Post Descending'
  desc_input = @input.sort_by {|k, v| v}.reverse
  desc_input.each do | x |
    print "#{x.ord} "
  end
  puts "\n\n"
end

def asc_desc
  puts "Would you like to sort by\n1.ascending\n2.descending?"
  print '> '
  choice = gets.strip.to_i
  case choice
    when 1
      post_asc
    when 2
      post_desc
    else
      puts 'Unknown. Pleae try again.'
      asc_desc
  end
end

def menu
  puts '--- Welcome to The Letters Challenge ---'
  print 'Please input a list of letters (space seperated): '.green
  print '> '
  @input = gets.strip.split(" ")
  post_input
  
  puts 'Sort output? Y/n'.green
  puts 'Q to quit'.red
  choice = gets.strip.downcase
  
  case choice
    when 'y'
      asc_desc
      menu
    when 'n'
      menu
    when 'q'
      puts 'Thanks for using this program!'.green
      exit
    else
      puts "Invalid input. Please try again.\n".red
      menu
  end

  puts "\n\n"
end

menu