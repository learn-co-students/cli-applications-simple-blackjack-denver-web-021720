require 'pry'
def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand{10}
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"# code #prompt_user here
end

def get_user_input
  return gets.chomp
end

def end_game(total)
  #binding.pry
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  total = deal_card()+deal_card()
  display_card_total(total)
  return total
end
def invalid_command
  puts 'Please enter a valid command'
end
def hit? (total)
while true
  prompt_user()
a = get_user_input()
if a == "h"
  total = total + deal_card()
  return total
elsif a == "s"
  return total
else
 invalid_command
end
end
end



#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome()
  total = initial_round()
  until total > 21 do
    total = hit?(total)
    display_card_total(total)
  end
end_game(total)

end
