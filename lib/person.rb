# A Note on Notation
# In the instructions below (and in other labs), you'll see this notation used to represent instance methods and class methods:

# ClassName#method_name: represents an instance method that can be called on the class
# ClassName.method_name: represents a class method that can be called on the class

#SELF - self is a special variable that points to the object that "owns" the currently executing code.


require 'pry'

class Person

    attr_reader :name, :happiness, :hygiene  #Use attr READER if you want it to not be able to change
    attr_accessor :bank_account #Use attr ACCESSOR if you want to be able to read and write the bank account number!

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    def happiness=(num)
        @happiness = num.clamp(0, 10)

        # if value <= 10 && value >=0
        #     @happiness = value
        # elsif value > 10
        #     @happiness = 10
        # else
        #     @happiness = 0
        # end
    end

    def hygiene=(num)
        @hygiene = num.clamp(0, 10)
    end

    def clean?
        if @hygiene > 7 
            true
        else false
        end
    end

    def happy?
        if @happiness > 7 
            true
        else false
        end
    end

    def get_paid(amount)
        @bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene = @hygiene + 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness = @happiness + 2 
        self.hygiene = @hygiene - 3
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness = @happiness + 3
        friend.happiness = friend.happiness + 3
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        if topic == "politics" 
            self.happiness = @happiness - 2
            friend.happiness = friend.happiness - 2
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness = @happiness + 1
            friend.happiness = friend.happiness + 1
            return "blah blah sun blah rain"
        else 
            return "blah blah blah blah blah"
        end
    end




    def return_self_name
        puts self.name
    end

end



buffy = Person.new("Buffy Summers")
willow = Person.new("Willow Rosenberg")
# friend = Person.new("friend")

willow.return_self_name

#binding.pry