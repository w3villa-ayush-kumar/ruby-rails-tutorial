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
