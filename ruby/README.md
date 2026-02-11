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

# Hash Methods in Ruby

Ruby provides many built-in methods to efficiently work with **hashes** — similar to arrays. These methods help check data, compare hashes, retrieve values, and clean up unwanted entries.

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

## Checking Available Methods

You can view all methods supported by a hash:

```ruby
h = {}
h.methods
```

---

## `empty?`

Checks whether a hash contains any key-value pairs.

```ruby
h = {}
h.empty?   # => true

h[:a] = 1
h.empty?   # => false
```

✅ Returns a boolean (`true` / `false`)
✅ Requires no arguments

---

## `eql?`

Compares two hashes for **content equality**.

```ruby
h1 = {a: 1, b: 2}
h2 = {a: 1, b: 2}

h1.eql?(h2)   # => true
```

### Important Rules:

- Keys must match
- Values must match
- Order does **NOT** matter

```ruby
{a: 1, b: 2}.eql?({b: 2, a: 1})
# => true
```

---

## `equal?`

Checks whether two variables reference the **same hash object in memory**.

```ruby
h1 = {a: 1}
h2 = {a: 1}

h1.equal?(h2)   # => false
```

Because they are different objects.

```ruby
h3 = h1
h1.equal?(h3)   # => true
```

### Difference: `eql?` vs `equal?`

| Method   | Checks           | Result                   |
| -------- | ---------------- | ------------------------ |
| `eql?`   | Content          | True if identical data   |
| `equal?` | Memory reference | True only if same object |

---

## `key?`

Checks if a specific key exists.

```ruby
h = {name: "Ruby"}

h.key?(:name)   # => true
h.key?("name") # => false (symbol ≠ string)
```

⚠️ Always pass the correct key type.

---

## `fetch`

Retrieves a value using a key.

```ruby
h = {language: "Ruby"}
h.fetch(:language)  # => "Ruby"
```

If the key does not exist:

```ruby
h.fetch(:version)
# => KeyError
```

✅ Safer than direct access when you want errors for missing keys.

---

## `compact`

Removes key-value pairs where the value is `nil`.

```ruby
h = {a: 1, b: nil}

h.compact
# => {a: 1}
```

### Destructive vs Non-Destructive

```ruby
h.compact   # Non-destructive (original unchanged)
h.compact!  # Destructive (modifies original)
```

---

## Do Key Orders Matter?

No. Hash comparisons focus on keys and values — not order.

---

## Ways to Get Values from a Hash

- Using `fetch`
- Using bracket syntax (`h[:key]`)

---

## Key Takeaways

- Ruby hashes include powerful built-in methods.
- Use `empty?` to check data presence.
- `eql?` compares content; `equal?` compares memory.
- `key?` verifies existence of a key.
- `fetch` is ideal when missing keys should raise errors.
- `compact` helps clean hashes by removing `nil` values.

Mastering these methods makes working with Ruby hashes much faster and safer.
