require 'colorize'
require 'pry'

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
  print '> '
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