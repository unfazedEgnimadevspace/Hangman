class Hangman
    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @correct_guessess = []
        @word_teaser = ""
        @word.first.size.times do
            @word_teaser +="_ "
        end
     end

    def words
        #add more arrays to increase the number of words that can be guessed
        [
            ["cricket", "A game loved by indians"],
            ["jogging", "we are not walking"],
            ["celebrate", "Remembering special ocassions"],
            ["continent", "There are 7 of these"],
            ["exotic", "Not from around here"]
        ]
    end


    def print_teaser last_guess = nil
     update_teaser(last_guess) unless last_guess.nil?

       puts @word_teaser
    end

    def update_teaser last_guess
       new_teaser = @word_teaser.split  

       new_teaser.each_with_index do |letter, index|
            #replace blank values with the correct guessed words
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
       end

      @word_teaser = new_teaser.join(' ') 
    end
    
    def make_guess
     if @lives > 0
        puts "Enter a letter"
        guess = gets.chomp
 
        good_guess = @word.first.include? guess

         if guess == 'exit'
            puts 'Thank you for playing'
         elsif good_guess    
    
 
        if good_guess
            puts "You got that one right"

            @correct_guessess << guess

          #remove correctly guessed alphabets  from the range letters
          @letters.delete guess


            print_teaser guess
            make_guess
        else
           @lives -= 1
            puts "Sorry try again please, you have #{@lives} trails left"
            make_guess
            
        end
     else
         puts 'Game over... better luck next time'
     end
    end 
end


    def begin
        #ask the user for a letter
       puts "New game has started .... your word has #{@word.first.size} letters" 
       puts "To exit game please type exit"
       print_teaser
       puts "Clue: #{@word.last}"

       make_guess
    end
    
end
game = Hangman.new
game.begin
