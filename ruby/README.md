# Ruby Introduction

## What is Ruby?

Ruby is an **interpreted, server-side scripting language** used to build dynamic web applications and APIs. It processes user requests, interacts with databases, and sends responses back to the browser.

**Example:** User submits a form → Ruby handles the request → Data is stored → Success response is returned.

---

## Scripting Language

Used to automate backend tasks such as:

- Handling requests
- Processing data
- Database communication
- Building REST APIs

---

## Client vs Server Side

- **Client-side:** Runs in the browser (UI, validation).
- **Server-side:** Runs on the server (logic, database operations).

---

## Interpreted vs Compiled

- **Interpreted:** Executes line-by-line and stops at the error (Ruby, Python).
- **Compiled:** Converts entire code before execution (C, C++).
- **Hybrid:** Java uses both compile + interpret.

---

## Everything is an Object

Ruby is purely object-oriented — numbers, strings, and more are all objects.

```ruby
5.class        # Integer
"Hi".class     # String
```

---

## Class & Object Example

```ruby
class Car
  def start
    puts "Car started"
  end
end

car = Car.new
car.start
```

---

## Setup Basics

**Requirements:**

- OS (Linux/macOS preferred)
- Code editor (VS Code, Sublime)
- Terminal

---

## Ruby Versions

- Prefer **Ruby 3.x+**
- Use **RVM (Ruby Version Manager)** to install and switch between versions.

---

## Key Points

- Ruby is interpreted and server-side.
- Used for dynamic web apps.
- Everything is an object.
- Use RVM to manage Ruby versions.

# Variables in Ruby

## What is a Variable?

A **variable** is a memory location used to store data that can change over time.

```ruby
a = 10
b = 20
```

Here, `a` and `b` point to memory locations storing `10` and `20`.

---

## Memory Location (Object ID)

Ruby allows you to check where an object is stored using `object_id`.

```ruby
a = 10
b = 20

puts a.object_id
puts b.object_id
```

Every object in Ruby has a unique memory reference.

---

## Variables are Objects

In Ruby, **everything is an object**, including variables.

You can check the class of a variable:

```ruby
a = 10
a.class     # Integer

str = "Hello"
str.class   # String
```

---

## Dynamic Typing in Ruby

Ruby does **not require type declaration**.
The type is decided at runtime.

```ruby
a = 10      # Integer
a = "Text" # Now becomes String
```

This flexibility is called **dynamic typing**.

---

## Types of Values a Variable Can Store

- Integer
- Float
- String
- Array
- Hash
- Boolean (`true` / `false`)
- Objects of custom classes

---

## Constants in Ruby

A **constant** is a value that should not be changed once defined.

### Rules:

- Must start with a **capital letter**.

```ruby
AGE = 10
AGE = 20
```

Ruby will show a **warning** if you try to change a constant.
(Though newer versions may still update it.)

---

## Variable vs Constant

| Variable                    | Constant                      |
| --------------------------- | ----------------------------- |
| Value can change freely     | Should not be changed         |
| No warnings on reassignment | Shows warning when reassigned |
| Lowercase naming            | Capitalized naming            |

---

## How to Define a Variable

Simply assign a value:

```ruby
name = "Ayush"
price = 99.9
is_active = true
```

No datatype required.

---

## How to Get Memory Address

Use the `object_id` method:

```ruby
name = "Ruby"
name.object_id
```

---

## Upcoming Important Topic

Ruby has **four types of variables**:

- Local variables
- Global variables
- Instance variables
- Class variables

These are heavily used in Ruby and Rails, especially in:

- Models
- Controllers
- Classes
- Methods

---

## Key Takeaways

- Variables store data in memory.
- Every variable is an object in Ruby.
- Ruby is dynamically typed.
- Constants start with a capital letter.
- Use `object_id` to view memory reference.

# Types of Variables in Ruby

Ruby provides multiple types of variables based on **scope** (where they can be accessed). Understanding them is important for Ruby and Rails development.

---

## 1. Local Variables

Local variables are accessible only within the **block or method** where they are defined.

### Rules:

- Start with a lowercase letter or `_`
- Must be defined before use
- Destroyed after the scope ends

```ruby
def greet
  message = "Hello"
  puts message
end
```

Trying to access `message` outside the method will cause an error.

**Scope:** Method, block, or loop.

---

## 2. Instance Variables

Instance variables belong to a specific **object** of a class.

### Rules:

- Start with `@`
- Accessible across instance methods

```ruby
class Student
  def initialize(name)
    @name = name
  end

  def show_name
    puts @name
  end
end
```

Each object can store different values.

---

## 3. Class Variables

Class variables are shared across **all objects** of a class.

### Rules:

- Start with `@@`
- Same value for every instance

```ruby
class Student
  @@total_students = 0

  def initialize
    @@total_students += 1
  end

  def self.count
    @@total_students
  end
end
```

Used when data should be common for the entire class.

---

## 4. Global Variables

Global variables can be accessed from **anywhere** in the program.

### Rules:

- Start with `$`

```ruby
$country = "India"
```

⚠️ **Not recommended** because:

- Hard to track changes
- Can cause unexpected bugs
- Makes code inconsistent

Avoid using them unless absolutely necessary.

---

## 5. Constants

Constants store values that should not change.

### Rules:

- Start with a capital letter

```ruby
PI = 3.14
```

Reassigning a constant gives a warning.

---

## Variable vs Constant

| Variable         | Constant           |
| ---------------- | ------------------ |
| Value can change | Should not change  |
| Lowercase naming | Capitalized naming |

---

## Key Differences (Quick View)

| Type     | Prefix   | Scope          |
| -------- | -------- | -------------- |
| Local    | `name`   | Method / Block |
| Instance | `@name`  | Per object     |
| Class    | `@@name` | Entire class   |
| Global   | `$name`  | Whole program  |
| Constant | `NAME`   | Fixed value    |

---

## Key Takeaways

- Scope defines where a variable can be used.
- Prefer local and instance variables for clean code.
- Use class variables for shared data.
- Avoid global variables.
- Constants help protect fixed values.

# Methods in Ruby

## What is a Method?

A **method** is a reusable block of code that performs specific tasks. It helps organize logic into smaller subroutines that can be executed whenever needed.

**Think of it like a function** in other programming languages.

---

## Defining a Method

A method starts with `def` and ends with `end`.

```ruby
def greet
  puts "Hello World"
end

# Calling the method
greet
```

### Rules:

- Always start with `def`
- Method name should be lowercase
- End with `end`

---

## Naming Convention

Ruby follows **snake_case** for method names.

- Single word → lowercase

```ruby
def greet
end
```

- Multiple words → separated by underscore

```ruby
def calculate_area
end
```

---

## Types of Methods

### 1. Method With Arguments

Requires values when calling the method.

```ruby
def area(length, width)
  length * width
end

area(10, 5) # => 50
```

⚠️ Passing fewer or extra arguments raises an error.

---

### 2. Method Without Arguments

Does not require any input.

```ruby
def rectangle_area
  length = 10
  width = 30
  length * width
end

rectangle_area # => 300
```

---

### 3. Method With Default Arguments

Provides fallback values if none are passed.

```ruby
def area(length = 10, width = 20)
  length * width
end

area        # => 200 (uses default values)
area(5, 5)  # => 25 (overrides defaults)
```

---

## Return Statement

Ruby automatically returns the **last line** of a method.

```ruby
def sum
  5 + 5
end
```

No need to explicitly write `return`.

### When to Use `return`

Use it when you want to exit early or return a value based on a condition.

```ruby
def check_number(num)
  return "Negative" if num < 0
  "Positive"
end
```

Once `return` executes, the rest of the method is skipped.

---

## Key Takeaways

- Methods make code reusable and organized.
- Follow snake_case naming.
- Three common types: with arguments, without arguments, default arguments.
- Ruby returns the last evaluated expression automatically.
- Use `return` mainly for conditional exits.

# Classes and Objects in Ruby

## Why Classes and Objects?

Ruby is a **pure object-oriented language**, meaning everything revolves around objects and classes.

- **Class** → Blueprint
- **Object** → Real instance created from the class

**Real-world example:**

- Class: `Student`
- Objects: Individual students with unique roll numbers, emails, etc.

---

## What is a Class?

A **class** is a container that groups:

- Variables (data / attributes)
- Methods (behavior)

It defines how objects should look and behave.

---

## Defining a Class

A class starts with the `class` keyword and ends with `end`.

```ruby
class Student
end
```

### Naming Convention

- Use **CamelCase**
- Usually a single word

Examples:

```ruby
class Student
class BankAccount
```

---

## Creating an Object

Objects are created using the `.new` method.

```ruby
student = Student.new
```

This process is called **instantiation**.

---

## Adding Methods to a Class

```ruby
class Student
  def greet
    puts "Hello Student"
  end
end

student = Student.new
student.greet
```

---

## Constructor (`initialize` Method)

The `initialize` method runs automatically when an object is created.

```ruby
class Student
  def initialize(name)
    @name = name
  end
end

student = Student.new("Ayush")
```

Used to set initial values for objects.

---

## Instance Variables in Classes

Instance variables store object-specific data.

### Rules:

- Start with `@`
- Accessible across instance methods

```ruby
class Student
  def initialize(name, email)
    @name = name
    @email = email
  end

  def display
    puts "Name: #{@name}"
    puts "Email: #{@email}"
  end
end
```

Each object can have different values.

---

## String Interpolation

Used to embed variables inside strings.

✅ Works with double quotes:

```ruby
puts "Hello #{@name}"
```

❌ Single quotes print as-is:

```ruby
puts 'Hello #{@name}'
```

---

## Key Difference: Class vs Object

| Class             | Object             |
| ----------------- | ------------------ |
| Blueprint         | Instance of class  |
| Logical structure | Real usable entity |
| Created once      | Can create many    |

---

## Key Takeaways

- Classes define structure and behavior.
- Objects are created using `.new`.
- `initialize` acts as a constructor.
- Instance variables store object data.
- Use double quotes for string interpolation.

# Getter, Setter & Accessor Methods in Ruby

Accessor methods control how instance variables are **read and updated** from outside a class. They help maintain encapsulation while keeping code short and readable.

---

## Getter Method

A **getter method** retrieves the value of an instance variable.

### Key Points:

- Required to access instance variables outside the class
- Method name is usually the same as the variable
- Takes **no arguments**

### Example:

```ruby
class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

user = User.new("Ravi")
puts user.name
```

---

## Setter Method

A **setter method** updates the value of an instance variable.

### Key Points:

- Uses `=` in the method name
- Accepts one argument (new value)

```ruby
class User
  def initialize(name)
    @name = name
  end

  def name=(new_name)
    @name = new_name
  end
end

user = User.new("Ravi")
user.name = "Alex"
```

---

## Why Not Write Them Manually?

Writing getters and setters for every attribute creates repetitive code. Ruby solves this using **accessors**.

---

## What are Accessors?

Accessors automatically generate getter and/or setter methods.

### Types of Accessors:

- `attr_reader` → Getter only
- `attr_writer` → Setter only
- `attr_accessor` → Getter + Setter

---

## `attr_reader` (Getter Only)

Automatically creates getter methods.

```ruby
class Student
  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end

student = Student.new("Ravi", "ravi@email.com")
puts student.name
```

### Rules:

- Must be used inside a class
- Only attributes listed are accessible
- Does NOT allow updates

---

## `attr_writer` (Setter Only)

Automatically creates setter methods.

```ruby
class Student
  attr_writer :name

  def initialize(name)
    @name = name
  end
end

student = Student.new("Ravi")
student.name = "Alex"  # Updated
```

⚠️ Cannot read the value unless a getter exists.

---

## `attr_accessor` (Getter + Setter)

Creates both methods automatically.

```ruby
class Student
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

student = Student.new("Ravi")
student.name = "Alex"
puts student.name
```

---

## Key Differences

| Method        | Read | Update |
| ------------- | ---- | ------ |
| Getter        | ✅   | ❌     |
| Setter        | ❌   | ✅     |
| attr_reader   | ✅   | ❌     |
| attr_writer   | ❌   | ✅     |
| attr_accessor | ✅   | ✅     |

---

## When to Use What?

- **Getter / attr_reader:** When data should be read-only.
- **Setter / attr_writer:** When updates are allowed but reading is restricted.
- **attr_accessor:** When both read and update are needed (most common).

---

## Advantages of Accessors

- Less boilerplate code
- Cleaner classes
- Easier maintenance
- Better readability
- Supports encapsulation

---

## Important Notes

- Instance variables cannot be accessed directly outside the class.
- Always declare attributes carefully.
- Prefer `attr_accessor` unless you intentionally want restricted access.

---

## Key Takeaways

- Getter → retrieves values.
- Setter → updates values.
- Accessors automate both.
- `attr_accessor` is widely used in real-world Ruby and Rails apps.

# Arrays in Ruby

## What is an Array?

An **array** is a data structure used to store multiple elements in a single variable.

### Characteristics:

- Ordered collection
- Index starts from **0**
- Can hold mixed data types
- Dynamic (grows and shrinks automatically)

```ruby
arr = [1, "Ruby", true]
```

---

## Accessing Elements

```ruby
arr = [10, 20, 30]
arr[0]   # => 10
arr[-1]  # => 30 (last element)
```

👉 Accessing a non-existing index returns **nil**.

---

## Creating Arrays

### Using Square Brackets

```ruby
arr = [1, 2, 3]
```

### Using `Array.new`

```ruby
Array.new            # => []
Array.new(3)        # => [nil, nil, nil]
Array.new(3, 0)     # => [0, 0, 0]
```

---

## Common Array Methods

### Length / Size

```ruby
arr.length
arr.size
```

Returns total number of elements.

---

## Adding Elements

### `push` or `<<`

Adds element at the end.

```ruby
arr.push(4)
arr << 5
```

### `unshift`

Adds element at the beginning.

```ruby
arr.unshift(0)
```

### `insert`

Adds element at a specific index.

```ruby
arr.insert(2, 99)
```

---

## Removing Elements

### `pop`

Removes the last element.

```ruby
arr.pop
```

### `shift`

Removes the first element.

```ruby
arr.shift
```

### `delete`

Removes all occurrences of a value.

```ruby
arr.delete(10)
```

### `delete_at`

Removes element at a specific index.

```ruby
arr.delete_at(2)
```

### `compact`

Removes all `nil` values.

```ruby
arr = [1, nil, 2]
arr.compact  # => [1, 2]
```

### `clear`

Deletes all elements.

```ruby
arr.clear
```

---

## Searching in Arrays

### `include?`

Checks if an element exists.

```ruby
arr.include?(3)
```

### `index`

Returns the index of an element.

```ruby
arr.index(20)
```

---

## Ordering Arrays

### `sort`

Sorts in ascending order.

```ruby
[3,1,2].sort  # => [1,2,3]
```

### `reverse`

Reverses the array.

```ruby
arr.reverse
```

---

## Array Transformations

### `map`

Transforms each element.

```ruby
[1,2,3].map { |n| n * 2 }
# => [2,4,6]
```

### `select`

Filters elements based on condition.

```ruby
[1,2,3,4].select { |n| n.even? }
# => [2,4]
```

### `reject`

Opposite of select.

```ruby
[1,2,3,4].reject { |n| n.even? }
# => [1,3]
```

---

## Destructive vs Non-Destructive Methods

### Non-Destructive

Returns a new array without changing the original.

```ruby
arr = [3,1,2]
sorted = arr.sort
```

### Destructive (`!`)

Modifies the original array.

```ruby
arr.sort!
```

⚠️ Methods ending with `!` usually change the original object.

---

## Important Notes

- Arrays can store mixed data types.
- Index always begins at **0**.
- Invalid index → `nil`.
- Prefer non-destructive methods unless modification is required.

---

## Key Takeaways

- Arrays manage collections efficiently.
- Ruby provides powerful built-in methods for insertion, deletion, searching, and transformation.
- Understand destructive vs non-destructive operations for safer code.
- Frequently used in real-world Ruby and Rails applications.

---

# Ruby Hashes

## What is a Hash?

A **Hash** is a data structure that stores data in **key → value pairs**.

```ruby
person = {
  "first_name" => "Ravi",
  "last_name" => "Singh",
  "email" => "ravi@example.com"
}
```

### Key Characteristics

- Stores multiple values under unique keys.
- Keys act as identifiers to retrieve values.
- More controlled than arrays because access is not index-based.

---

## Hash vs Array

| Feature   | Array          | Hash          |
| --------- | -------------- | ------------- |
| Access    | Index (0,1,2…) | Key           |
| Structure | Ordered        | Key-based     |
| Control   | Less           | More flexible |

---

## Creating Hashes

### Empty Hash

```ruby
hash = {}
```

### With Values

```ruby
person = {
  name: "Ravi",
  email: "ravi@gmail.com",
  contact: "9999999999"
}
```

---

## Accessing Values

```ruby
person[:name]
```

✔ Returns the value associated with the key.

⚠️ Use the correct key type:

- Symbol ≠ String

```ruby
person[:name]    # correct
person["name"]  # may return nil
```

---

## Inserting & Updating Values

### Add New Pair

```ruby
person[:age] = 25
```

### Update Existing Key

```ruby
person[:name] = "Ravi Kumar"
```

✔ Latest value overrides the old one.

---

## Duplicate Keys

Hashes **cannot store duplicate keys**.

```ruby
{ name: "Ravi", name: "Kumar" }
```

✔ Final Output:

```ruby
{ name: "Kumar" }
```

---

## Symbols vs Strings (Keys)

### Symbols Preferred Because:

- Better memory optimization
- Faster comparisons
- Immutable

```ruby
{name: "Ravi"}   # Recommended
{"name" => "Ravi"}
```

---

| Feature       | Symbol Key (`:a`)       | String Key (`"a"`)            | Number Key (`1`) |
| ------------- | ----------------------- | ----------------------------- | ---------------- |
| Example Hash  | `{ a: 1 }`              | `{ "a" => 1 }`                | `{ 1 => "one" }` |
| Access Syntax | `h[:a]`                 | `h["a"]`                      | `h[1]`           |
| Equal To      | `:a`                    | `"a"`                         | `1`              |
| Not Equal To  | `"a"`                   | `:a`                          | `"1"`            |
| Mutable?      | No (immutable)          | Yes                           | No (immutable)   |
| Memory Usage  | Lower (reused object)   | Higher (new object each time) | Low              |
| Common Usage  | Rails, configs, options | JSON, APIs, external data     | Lookup tables    |

---

## Advantages of Hashes

- Flexible data access
- Better real-world modeling (user data, configs, metadata)
- No need to remember numeric positions
- Efficient lookup

---

# Important Hash Methods

Ruby provides many built-in methods to operate on hashes.

View all methods:

```ruby
hash.methods
```

---

## 1. `empty?`

Checks whether a hash has any key-value pairs.

```ruby
hash.empty?
```

✔ Returns:

- `true` → if empty
- `false` → otherwise

---

## 2. `eql?`

Checks if two hashes are **identical in content**.

```ruby
h1.eql?(h2)
```

✔ Order of keys does NOT matter.

❗ Returns false if:

- Values differ
- Keys differ

---

## 3. `equal?`

Checks if two variables reference the **same hash object in memory**.

```ruby
h1.equal?(h2)
```

👉 Difference from `eql?`:

- `eql?` → compares data
- `equal?` → compares memory reference

```ruby
h2 = h1
h1.equal?(h2)   # true
```

---

## 4. `key?`

Checks whether a key exists.

```ruby
hash.key?(:name)
```

✔ Returns boolean.

---

## 5. `fetch`

Retrieves value using a key.

```ruby
hash.fetch(:name)
```

✔ Returns value if key exists.

❗ Raises **KeyError** if key is missing.

---

## 6. `compact`

Removes keys that have `nil` values.

### Non‑Destructive

```ruby
hash.compact
```

Does NOT modify original hash.

### Destructive

```ruby
hash.compact!
```

Permanently removes nil pairs.

---

## Sorting Hashes

Calling `sort` typically sorts based on **keys**, not values.

---

## Key Ordering in Comparison

When comparing hashes:

✔ Order **does not matter**.

Only checks:

- Keys
- Values

---

# Quick Interview Notes ⭐

### Difference — `eql?` vs `equal?`

| eql?            | equal?                  |
| --------------- | ----------------------- |
| Checks content  | Checks memory reference |
| Data comparison | Object identity         |

---

### Ways to Get Value From Hash

- `hash[:key]`
- `hash.fetch(:key)`

---

### How to Check Key Exists?

```ruby
hash.key?(:key)
```

---

# Beginner Mistakes to Avoid

- Mixing string and symbol keys.
- Assuming duplicate keys are allowed.
- Forgetting `fetch` throws an error.
- Confusing `eql?` with `equal?`.

---

# Summary

- Hash = key-value data structure.
- Provides flexible and efficient data access.
- Symbols are preferred as keys.
- Built-in methods simplify operations.
- `eql?` compares data, `equal?` compares objects.

# Loops in Ruby

Loops are a fundamental programming concept used to **repeat a block of code multiple times** based on a condition.

They help automate repetitive tasks and make programs cleaner and more efficient.

---

## What is a Loop?

A loop executes a set of instructions until a specific condition is met.

### Example Use Cases:

- Sending greetings to multiple users
- Printing messages several times
- Processing collections like arrays or hashes
- Automating repetitive operations

---

## Why Use Loops?

Without loops, you would need to write the same code again and again.

Instead of this:

```ruby
puts "Hello"
puts "Hello"
puts "Hello"
```

Use a loop:

```ruby
3.times do
  puts "Hello"
end
```

✅ Cleaner code
✅ Less repetition
✅ Easier maintenance

---

## Common Loop in Ruby

### `times` Loop

Executes a block a fixed number of times.

```ruby
5.times do
  puts "Hello"
end
```

👉 Runs exactly **5 times**.

---

## Loop with Counter

Ruby automatically tracks the iteration index.

```ruby
5.times do |i|
  puts "Iteration #{i}"
end
```

Output starts from **0**.

---

## Advantages of Loops

- Reduce code duplication
- Improve readability
- Save development time
- Useful for working with collections
- Core concept across almost all programming languages

---

## Things to Remember

- Loops operate on collections or run until conditions are satisfied.
- Avoid writing repetitive code manually.
- Choose loops when a task must run multiple times.

---

## Key Takeaways

- Loops repeat code automatically.
- They are heavily used in real-world programs.
- Help manage large datasets efficiently.
- Essential concept for mastering Ruby and other programming languages.

# For Loop in Ruby

The **for loop** in Ruby is used to iterate over a collection of elements such as ranges, arrays, or other enumerable objects. It allows you to execute a block of code for each element in the collection.

---

## What is a For Loop?

A `for` loop runs code repeatedly by traversing through a defined collection.

### Basic Syntax

```ruby
for variable in collection
  # code to execute
end
```

- `variable` → Holds the current element during each iteration.
- `collection` → Can be a range, array, or similar structure.

---

## Example

```ruby
for i in 1..5
  puts i
end
```

**Output:**

```
1
2
3
4
5
```

The loop starts at `1` and ends at `5`.

---

## Range Operators in Ruby

When using ranges inside a `for` loop, it is important to understand the difference between **two dots** and **three dots**.

### Inclusive Range (`..`)

Includes both the start and end values.

```ruby
for i in 1..5
  puts i
end
```

Runs from **1 to 5**.

---

### Exclusive Range (`...`)

Excludes the last value.

```ruby
for i in 1...5
  puts i
end
```

Runs from **1 to 4**.

---

## Key Characteristics

- Iterates over a fixed collection.
- Automatically stops when the collection ends.
- Cannot run infinitely when used with ranges.
- Useful when the number of elements is known.

---

## Example: Iterating Over a Collection

```ruby
numbers = [10, 20, 30]

for num in numbers
  puts num
end
```

---

## Advantages

- Simple and easy to read.
- Ideal for traversing collections.
- Helps perform operations on multiple elements efficiently.
- Reduces repetitive code.

---

## Things to Remember

- Always define a valid collection.
- Understand the difference between `..` and `...`.
- The loop ends automatically after the last element.
- Best suited for straightforward iteration tasks.

---

## Key Takeaways

- `for` loops iterate over collections.
- Ranges control how many times the loop runs.
- `..` includes the last value, `...` excludes it.
- Commonly used for solving repetitive and collection-based problems.

---

# While Loop in Ruby

## What is a While Loop?

A **while loop** repeatedly executes a block of code **as long as a condition evaluates to `true`**.

- The condition must return a boolean (`true` or `false`).
- Once the condition becomes `false`, the loop stops.
- Execution continues with the code written after the loop.

---

## Basic Syntax

```ruby
i = 1

while i != 10
  puts "Hello Ruby Developers"
  i += 1
end
```

### Flow:

1. Initialize a loop variable.
2. Check the condition.
3. Execute the loop body.
4. Update the variable.
5. Repeat until the condition becomes false.

---

## Key Requirements

### 1. Initialize a Variable

The loop needs a variable that participates in the condition.

```ruby
i = 1
```

### 2. Provide a Condition

The condition determines whether the loop runs.

```ruby
while i != 10
```

### 3. Update the Variable

Without updating, the loop may never end.

```ruby
i += 1
```

---

## Infinite Loop Risk

Unlike `for` loops, **while loops can easily become infinite** if written incorrectly.

### Case 1 — No Increment (Infinite Execution)

```ruby
i = 1

while i != 10
  puts "Hello"
end
```

**Problem:** `i` never changes → condition always true.

---

### Case 2 — Wrong Increment

```ruby
i = 1

while i != 10
  puts "Hello"
  i += 5
end
```

Sequence: `1 → 6 → 11 → 16...`

`i` never becomes `10`, so the loop never stops.

---

### Case 3 — Condition Always False

```ruby
i = 1

while i > 10
  puts "Hello"
end
```

The loop **never executes**, making it useless.

---

## While vs For Loop

| While Loop              | For Loop                        |
| ----------------------- | ------------------------------- |
| Condition-based         | Range/collection-based          |
| Can become infinite     | Always finite                   |
| Requires manual updates | Iteration handled automatically |
| More flexible           | Safer for fixed iterations      |

---

## Scope Behavior

**While loops do NOT create their own scope.**

Variables declared inside the loop are accessible outside it.

---

## Best Practices

- Always modify the loop variable.
- Ensure the condition eventually becomes false.
- Avoid conditions that are permanently true or false.
- Use `for` when iterations are fixed.
- Use `while` when the number of iterations is unknown.

---

## Things to Remember

- While loops depend entirely on the condition.
- Incorrect logic can cause infinite execution.
- A permanently false condition prevents execution.
- While loops share the same scope as surrounding code.

---

# Until Loop in Ruby

## What is an Until Loop?

An **until loop** is the opposite of a `while` loop.

- `while` runs **when the condition is true**.
- `until` runs **when the condition is false**.
- The loop stops once the condition becomes true.

---

## Basic Syntax

```ruby
i = 1

until i == 10
  puts "Hello Ruby Developers"
  i += 1
end
```

### Flow:

1. Initialize a variable.
2. Check the condition.
3. Execute the loop **while the condition is false**.
4. Update the variable.
5. Stop when the condition becomes true.

---

## While vs Until

| While                              | Until                             |
| ---------------------------------- | --------------------------------- |
| Runs when condition is **true**    | Runs when condition is **false**  |
| Stops when condition becomes false | Stops when condition becomes true |
| Easier for positive conditions     | Useful for negative conditions    |

---

## Infinite Loop Risk

Just like `while`, an `until` loop can also become infinite.

### Example — Wrong Update

```ruby
i = 1

until i > 10
  puts "Hello"
  i -= 1
end
```

**What happens?**

- `1 > 10` → false → loop runs
- `0 > 10` → false
- `-1 > 10` → false

The condition never becomes true, so the loop runs forever.

---

## Key Takeaways

- `until` is simply the logical opposite of `while`.
- Always update the loop variable correctly.
- Ensure the condition eventually becomes true.
- Poor logic can cause infinite execution.

---

# Ruby Loops — Quick Comparison

| Feature              | For                | While              | Until               |
| -------------------- | ------------------ | ------------------ | ------------------- |
| Based On             | Collection / Range | Condition          | Condition           |
| Infinite Risk        | Very Low           | High               | High                |
| Manual Update Needed | No                 | Yes                | Yes                 |
| Best Use Case        | Known iterations   | Unknown iterations | Negative conditions |

---

## When to Use Which?

**Use `for` when:**

- Iteration count is fixed
- Looping over arrays, ranges, or collections

**Use `while` when:**

- You want execution while a condition remains true
- Iterations are unpredictable

**Use `until` when:**

- You want execution until something becomes true
- The condition is easier to express negatively

---

## Common Loop Mistakes

- Forgetting to update the loop variable
- Writing conditions that never change
- Creating permanently true/false expressions
- Using `while`/`until` when a `for` loop is safer

---

# Map and Collect in Ruby

## What is `map`?

`map` is an iterator used to transform each element of a collection such as an array, hash, or any enumerable object.

- Executes a block for every element.
- Returns a **new collection** with transformed values.
- Does **not modify** the original collection.

### Example

```ruby
numbers = [1, 2, 3, 4]
result = numbers.map { |n| n * 2 }

puts result.inspect   # [2, 4, 6, 8]
puts numbers.inspect  # [1, 2, 3, 4]
```

**Observation:** The original array remains unchanged.

---

## Destructive Version — `map!`

`map!` performs the same transformation but **modifies the original collection**.

### Example

```ruby
numbers = [1, 2, 3]
numbers.map! { |n| n * 2 }

puts numbers.inspect  # [2, 4, 6]
```

### When to Use

Use destructive methods only when you intentionally want to mutate the data and no longer need the original values.

---

## What is `collect`?

`collect` is an alias of `map`. Both methods behave identically.

```ruby
numbers = [1, 2, 3]
numbers.collect { |n| n + 1 }
# => [2, 3, 4]
```

### Is There Any Difference?

No functional difference exists between `map` and `collect`.

- `map` → Preferred in modern Ruby codebases.
- `collect` → Older naming, still fully supported.

Most developers choose **map** because it clearly communicates data transformation.

---

## Key Characteristics of `map`

- Works on collections (arrays, hashes, enumerables).
- Always returns a new object unless `map!` is used.
- Ideal for transforming data.
- Maintains predictable behavior.

---

## Common Use Cases

Use `map` when you need to:

- Convert values (e.g., currency calculations).
- Format strings.
- Extract attributes from objects.
- Perform mathematical operations.
- Prepare data for APIs or UI layers.

---

## Common Mistake

Accidentally using `map!` can overwrite important data.

```ruby
users.map! { |u| u.name }
```

After execution, the original user objects are replaced with names.

Always choose between **non-destructive (`map`)** and **destructive (`map!`)** deliberately.

---

## Quick Comparison

| Method  | Modifies Original? | Returns New Collection? |
| ------- | ------------------ | ----------------------- |
| map     | No                 | Yes                     |
| map!    | Yes                | No                      |
| collect | No                 | Yes                     |

---

## map vs each

| Feature      | map                 | each                             |
| ------------ | ------------------- | -------------------------------- |
| Purpose      | Transform data      | Iterate over data                |
| Return Value | New collection      | Original collection              |
| Best For     | Data transformation | Side effects (printing, logging) |

### Example

```ruby
numbers = [1, 2, 3]

numbers.each { |n| n * 2 }
# => [1, 2, 3]  (no transformation)

numbers.map { |n| n * 2 }
# => [2, 4, 6]
```

---

## Important Takeaways

- `map` is used for transforming collections.
- `map!` mutates the original data.
- `collect` is simply another name for `map`.
- Prefer non-destructive methods unless modification is required.
- Choose `map` over `each` when you expect a transformed result.
