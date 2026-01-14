# # modules
# module Logger
#   def log(message)
#     puts "[LOG]: #{message}"
#   end
# end

# # modules for namespacing
# module Admin
#   class User
#   end
# end

# module Customer
#   class User
#   end
# end

# module Greetable
#   def greet
#     "Hello!"
#   end
# end

# class User
#   include Greetable # instance method
# end

# class User
#   extend Greetable 
# end

# User.greet


# user = User.new
# user.greet

# # module namespacing usage
# Admin::User.new
# Customer::User.new

# # class method vs instance method
# class User
#   def self.platform
#     "Web Application"
#   end
# end

# User.platform

# class User
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     "Hello, #{@name}"
#   end
# end

# user = User.new("Ayush")
# user.greet

# # Instance Method Access
# def full_name
#   "#{@first} #{@last}"
# end
# # Class Method Access
# def self.total_users
#   User.count
# end

# # Another way to create class method
# class User
#   class << self
#     def active
#       where(active: true)
#     end

#     def inactive
#       where(active: false)
#     end
#   end
# end


# # lookup chain
# 1. Singleton class (eigenclass) of object
# 2. Class of object
# 3. Modules included in class (last included first)
# 4. Superclass
# 5. Modules included in superclass
# 6. Object
# 7. Kernel
# 8. BasicObject

# include

# Module methods come after the class.

# class User
#   include A
# end


# Lookup:

# User → A → Object

# prepend

# Module methods come before the class.

# class User
#   prepend A
# end


# Lookup:

# A → User → Object


# prepend can override class methods safely

# User.ancestors

# # super
# super is a keyword used to call the same method in the next level of the method lookup chain.

# It does NOT mean “call parent class only”
# It means “call the next method Ruby would find”
# class Parent
#   def greet
#     "Hello from Parent"
#   end
# end

# class Child < Parent
#   def greet
#     super + " & Child"
#   end
# end

# Child.new.greet

# module A
#   def greet
#     "A"
#   end
# end

# module B
#   def greet
#     super + " B"
#   end
# end

# class User
#   include A
#   include B

#   def greet
#     super + " User"
#   end
# end
# Execution Flow
# User#greet
# → B#greet
# → A#greet

# super with Arguments
# Automatic Argument Passing
# def greet(name)
#   "Hello #{name}"
# end

# def greet(name)
#   super
# end


# Arguments are passed automatically

# Explicit Arguments
# def greet(name)
#   super("Ayush")
# end

# No Arguments
# def greet(name)
#   super()
# end


# super() sends no arguments

# # block, proc and lambda
# A block is an anonymous piece of code passed to a method.
# do |arg|
#   # code
# end
# [1, 2, 3].each do |n|
#   puts n * 2
# end

# def greet
#   puts "Before block"
#   yield
#   puts "After block"
# end

# greet { puts "Hello!" }

# A Proc is a block converted into an object.
# double = Proc.new { |x| x * 2 }

# double.call(4)

# def calculate(x, action)
#   action.call(x)
# end

# square = proc { |x| x * x }

# calculate(3, square)

# A lambda is a special type of Proc with stricter rules.
# add = ->(a, b) { a + b }

# add.call(2, 3)

# Argument Handling Differences
# Proc (Loose)
# p = proc { |x, y| x }
# p.call(1)       # => 1

# Lambda (Strict)
# l = ->(x, y) { x }
# l.call(1)       # ArgumentError

# Converting Block to Proc (&)
# def run(&block)
#   block.call
# end

# run { puts "Hello" }

# Passing Proc as Block
# printer = proc { |x| puts x }

# [1, 2, 3].each(&printer)


# | Feature             | Block               | Proc                | Lambda              |
# | ------------------- | ------------------- | ------------------- | ------------------- |
# | Object              | ❌                  | ✅                  | ✅                  |
# | Stored in variable  | ❌                  | ✅                  | ✅                  |
# | Argument strictness | N/A                 | Loose               | Strict              |
# | `return` behavior   | Returns from method | Returns from method | Returns from lambda |
# | Use case            | Iteration, DSL      | Reusable logic      | Functional-style    |

# # arrays methods
# arr = [1, "hello", true, { a: 1 }]
# arr = []
# arr = Array.new
# arr = Array.new(3)        # [nil, nil, nil]
# arr = Array.new(3, 0)     # [0, 0, 0]
# Array.new(3, [])  # BAD

# arr = [10, 20, 30, 40]

# arr[0]      # 10
# arr[-1]     # 40
# arr[1, 2]   # [20, 30]
# arr.first   # 10
# arr.last    # 40

# arr << 50
# arr.push(60)
# arr.unshift(0)

# arr.pop      # removes last
# arr.shift    # removes first
# arr.delete(20)
# arr.delete_at(1)


# # exception handling intro / custom

# #sessions, cookies, stateless and stateful