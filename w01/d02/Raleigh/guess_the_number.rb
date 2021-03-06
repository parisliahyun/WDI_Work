# Display a prompt for the user
puts "I am thinking of an integer between 0 and 10... what number am I thinking of? "


# Obtain the user's input and interpret it as an integer.
answer = gets.chomp.to_i

# Generate a random number between 0 and 10
secret = rand(1..9)

# Use a while loop to let the user guess again until he/she gets the answer right.
while answer != secret
  puts "No, that's not right."
    if answer > secret
      puts "Try a lower number: " 
    else
      "Try a higher number: "
    end
  answer = gets.chomp.to_i 
end

# Display a congratulatory response
puts "That's it!  How'd you know?!"
