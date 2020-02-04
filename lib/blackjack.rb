require "pry"

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  card1 = deal_card 
  card2 = deal_card
  total = card1 + card2

  display_card_total(total)
  
  total
end

def hit?(current_total)
  prompt_user
  move = get_user_input
  
  if move == "s"
    # "don't deal a card, staying"
  elsif move == "h"
    card = deal_card
    current_total += card
  else
    invalid_command
    hit?(current_total)
  end
  
  current_total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome 
  total = initial_round
  
  until total > 21
    total = hit?(total)
    display_card_total(total)
  end
  
  end_game(total)
end
    
