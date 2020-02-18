require 'pry'
# #### The `welcome` Method

# This method uses `puts` to output the message: "Welcome to the Blackjack Table".

# #### The `deal_card` Method

# This method generates and returns a random number between 1 and 11.

# #### The `display_card_total` Method

# This method accepts an argument of a number and puts out the phrase "Your cards
# add up to #{card_total}". The number that this method takes in as an argument is
# the sum of a players cards. This method will be *called inside another method*,
# at which point the real sum of a player's cards will be passed in as an
# argument. This is not important right now. Just define the method to take in a
# number and puts out the appropriate phrase using that number.

# #### The `prompt_user` Method

# This method asks the user for input by outputting the phrase "Type 'h' to hit or
# 's' to stay".

# #### The `get_user_input` Method

# This method is very basic. It only needs to use the `gets` method to capture the
# user's input. Eventually, when we take all of these helper methods and assemble
# them into the larger method that enacts the gameplay, this method will be used
# *after* we prompt the user for input to actually capture and store their input.

# #### The `end_game` Method

# This method takes in an argument of a number, which will be a player's card
# total, and outputs the message "Sorry, you hit #{card_total}. Thanks for
# playing!"

# #### The `initial_round` Method

# This method represents the first round of the game for a given player. It should
# call on the `deal_card` method twice, use the `display_card_total` method to
# `puts` out the sum *and then* return the sum. This method will, therefore, call on
# two other helper methods, `deal_card` and `display_card_total`, which takes in
# an argument of the sum of both invocations of `deal_card`.

# #### The `hit?` Method

# This method is a bit more complex. It should take in an argument of the player's
# current card total. So, set up your `hit?` method to take in an argument of a
# number.

# Then, the method should use the `prompt_user` method to prompt the user for
# input and the `get_user_input` method to get and store the user's input. Now we
# need to implement some logic. If the player's input is `'s'`, we don't deal a
# new card. If the player's input is `'h'`, we do need to deal a new card. In this
# case, use the `deal_card` method to deal a new card and increment the player's
# card total by whatever number is returned by `deal_card`.

# If the player's input is *neither* `'h'` *nor* `'s'`, call on the
# `invalid_command` method to output the phrase "Please enter a valid command".
# Then, call on the `prompt_user` method again to remind your user what a valid
# command is.  

# In either case, our method should then return the player's current card total.

# ### The Runner Method: `runner`

# Once you get all of the tests in the first part of the test suite passing, you
# have built the building blocks of our blackjack game. Now, we need to put them
# all together in the `runner` method. The `runner` method is responsible for
# enacting the gameplay *until* the user loses. Remember that a player loses if
# the sum of their cards exceeds 21.

# Here's how we want our game to run:

# 1. Welcome the user
# 2. Deal them their first two cards, i.e. their `initial_round`
# 3. Ask them if they want to hit or stay
# 4. If they want to stay, ask them again!
# 5. If they want to hit, deal another card and display the new total
# 6. If their card total exceeds 21, the game ends.

# Use a loop constructor (I'd recommend `until`, but that is by no means your only
# option) to enact the above gameplay in the `runner` method. Then, check out the
# `lib/runner.rb` file. Notice that it is simply calling the `runner` method. The
# runner file will call the `runner` method which should, in turn, utilize all the
# other methods you built!

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(sum)
  puts "Your cards add up to #{sum}"
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
  card1 = deal_card
  card2 = deal_card
  sum = card1 + card2
  display_card_total(sum)
  return sum
end

def invalid_command
  puts "Please enter a valid command"
end

def hit?(card_total)
  prompt_user
  input = get_user_input
  if input == 'h'
    card_total += deal_card
  elsif input == 's'
    card_total
  else
    invalid_command
    prompt_user
    input = get_user_input
  end
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  sum = initial_round
  card_total = hit?(sum)
  display_card_total(card_total)
  until card_total > 21
    card_total = hit?(card_total) 
    display_card_total(card_total)
  end
  end_game(card_total)
end
    
