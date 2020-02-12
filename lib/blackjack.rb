def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_one = deal_card
  card_two = deal_card
  
  card_total = card_one + card_two
  
  display_card_total(card_total)
  
  card_total
end

def hit?(number)
  prompt_user
  user_input = get_user_input
  
  if user_input == "s"
    # Stay 
  elsif user_input == "h"
    new_card = deal_card
    number += new_card
  else
    invalid_command
    hit?(number)
  end
  
  number
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
  
  while true do
    if total > 21
      break
    end
    
    total = hit?(total)
    display_card_total(total)
  end
  
  end_game(total)
end
