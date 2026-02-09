# Variables

name = "Ayush"
age = 24
puts "Hello #{name}, age #{age}"


# Methods

# def greet(name)
def greet name
    "Hello #{name}"
end

puts greet("Ayush")


# Predicate methods

ans = 5.even?
puts ans


# Bang methods

name.upcase!
puts name


# Arrays

nums = [1, 2, 3]
updatedNums = nums.map { |n| n * 2}
puts updatedNums

singleLine = nums.map(&:to_s)
puts singleLine


# Hashes

user = { lang: "ruby", ver: 269}
puts user[:lang]
puts user[:ver]


# Blocks

3.times do 
    puts "Hi" # with var
end

3.times { |i| puts i} # one line


# Classes & OOP

class User
    attr_accessor :ai

    def initialize(ai)
        @ai = ai
    end

    def tool
        "Using #{@ai}"
    end
end

u = User.new("ChatGPT")
puts u.tool 


# Modules

module Trackable
    def track
        "Tracking..."
    end
end

class Order
    include Trackable
end

