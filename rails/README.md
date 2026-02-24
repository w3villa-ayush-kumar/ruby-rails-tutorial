# Introduction to Ruby on Rails

## Introduction

Ruby on Rails (Rails) is a web development framework built using the Ruby programming language. It is designed to make web application development faster, more productive, and easier to maintain.

Rails provides a complete structure for building database-driven web applications, including tools for handling user registration, displaying data, managing databases, and connecting frontend and backend components.

## Core Concept

Ruby on Rails is a full-stack web framework that follows key design principles:

* Model-View-Controller (MVC) architecture
* Convention over Configuration
* Don’t Repeat Yourself (DRY)

### MVC Architecture

Rails separates application logic into three main components:

* Model → Handles database interaction and business logic
* View → Handles user interface and presentation
* Controller → Handles user requests and connects Models with Views

This separation makes applications organized, maintainable, and scalable.

### Convention over Configuration

Rails provides a standard directory structure and predefined conventions. Developers do not need to write extensive configuration files.

* Standard project structure
* Predefined environments (development, test, production)
* Automatic mapping between models and database tables

### DRY (Don’t Repeat Yourself)

Code should not be duplicated across the application.

If the same logic is written in multiple places and needs updating later, it becomes difficult to maintain. Rails encourages reusable methods and centralized logic to improve maintainability.

## Features of Rails

* Built-in database integration using Active Record
* RESTful routing system
* Automatic handling of CRUD operations
* Environment management (development, test, production)
* Strong community support and documentation
* Scaffolding to quickly generate models, views, and controllers

## Active Record

Active Record is the ORM (Object Relational Mapping) layer in Rails.

It allows developers to:

* Write Ruby code instead of raw SQL queries
* Interact with database tables as Ruby classes
* Perform create, read, update, delete operations easily

Example:

```ruby
User.create(name: "John", age: 25)
User.where(age: 25)
```

## Project Structure

Rails applications come with a standard directory structure:

* app/models
* app/views
* app/controllers
* config/
* db/
* public/

This organized structure helps developers know exactly where to place files.

## Why Use Rails?

* Rapid development
* Clean and maintainable code structure
* Built-in best practices
* Strong documentation
* Suitable for building scalable web applications

Rails simplifies complex web development tasks and allows developers to focus more on business logic rather than configuration and setup.

## Comparison

| Concept              | Without Rails         | With Rails                   |
| -------------------- | --------------------- | ---------------------------- |
| Configuration        | Manual setup required | Convention-based setup       |
| Database Interaction | Write raw SQL         | Use Active Record ORM        |
| Project Structure    | Developer-defined     | Standardized structure       |
| Code Reusability     | Often duplicated      | Encouraged via DRY principle |

Ruby on Rails provides a structured and efficient way to build modern web applications while following clean architecture principles.

# Creating a New Ruby on Rails Application

## Introduction

Before starting a Ruby on Rails project, it is important to verify the installed versions of Ruby and Rails. Once verified, a new Rails application can be generated using built-in Rails commands.

Rails automatically creates a complete project structure with all necessary folders and configuration files required for web development.

## Core Concept

To begin working with Rails, follow these essential steps:

1. Check installed versions of Ruby and Rails.
2. Create a new Rails application.
3. Understand the generated directory structure.
4. Start the Rails server.
5. View the default welcome page.

Rails follows Convention over Configuration, so most setup is handled automatically when a new project is created.

## Syntax

### Check Ruby Version

```bash
ruby -v
```

### Check Rails Version

```bash
rails -v
```

### Create a New Rails Application

```bash
rails new student_management
```

This command:

* Creates a new directory with the given name
* Generates the standard Rails folder structure
* Installs required dependencies

### Navigate into Project Directory

```bash
cd student_management
```

### Start Rails Server

```bash
rails server
```

or

```bash
rails s
```

## Example Workflow

```bash
ruby -v
rails -v
rails new student_management
cd student_management
rails server
```

After starting the server, open a browser and visit:

```
http://localhost:3000
```

You will see the default Rails welcome page.

## Important Points

* `rails new` automatically sets up the entire application structure.
* A standard directory structure is generated, including:

  * app/
  * config/
  * db/
  * public/
  * Gemfile (dependency management)
* Rails manages different environments:

  * development
  * test
  * production
* The default server runs on port 3000.
* Always run `rails server` inside the project directory.

## Directory Structure Overview

| Folder/File | Purpose                             |
| ----------- | ----------------------------------- |
| app/        | Contains models, views, controllers |
| config/     | Configuration files                 |
| db/         | Database files and migrations       |
| public/     | Static files                        |
| Gemfile     | Manages project dependencies        |

## Comparison

| Task                   | Command Used       |
| ---------------------- | ------------------ |
| Check Ruby version     | ruby -v            |
| Check Rails version    | rails -v           |
| Create new application | rails new app_name |
| Start server           | rails server       |

Creating a Rails application is straightforward due to its automated setup and structured project organization.

# Creating a Controller in Ruby on Rails

## Introduction

In Ruby on Rails, a controller is responsible for handling user requests, processing them, and returning appropriate responses. It acts as the middle layer between Models and Views in the MVC (Model-View-Controller) architecture.

## Core Concept

A controller:

* Receives HTTP requests from users.
* Interacts with models if needed.
* Sends data to views for rendering.
* Controls application flow.

All controllers in a Rails application inherit from `ApplicationController`, which itself inherits from `ActionController::Base`.

Hierarchy:

ApplicationController → CustomController → Actions

Each controller contains methods called actions. Every action typically corresponds to a view.

## Syntax

### Generate Controller Using Command

```bash
rails generate controller welcome
```

or

```bash
rails g controller welcome
```

This command creates:

* app/controllers/welcome_controller.rb
* app/views/welcome/
* Related helper and test files

### Basic Controller Structure

```ruby
class WelcomeController < ApplicationController
  def index
  end
end
```

## Example

### Creating a Welcome Controller

```bash
rails g controller welcome index
```

Controller file:

```ruby
class WelcomeController < ApplicationController
  def index
    @message = "Welcome to my application"
  end
end
```

Corresponding view (app/views/welcome/index.html.erb):

```erb
<h1><%= @message %></h1>
```

When the route is configured and accessed, this action will display the message in the browser.

## Important Points

* Controller names must be in CamelCase and end with `Controller`.

  * Example: `WelcomeController`
* File names must be in snake_case.

  * Example: `welcome_controller.rb`
* All controllers inherit from `ApplicationController`.
* Actions inside controllers should be meaningful and clearly named.
* Each action typically maps to a corresponding view file.
* Follow Rails naming conventions for clean structure.

## Comparison

| Component  | Responsibility                                    |
| ---------- | ------------------------------------------------- |
| Model      | Handles business logic and database interaction   |
| View       | Handles UI and presentation                       |
| Controller | Handles request flow and connects Model with View |

Controllers play a central role in managing application logic and routing user interactions within a Rails application.

# Controller Templates and Routing in Rails

## Introduction

After creating a controller in Rails, the next step is to create a template (view file) and connect it through routing. When a user visits a specific URL, Rails processes the request through a controller action and renders the corresponding template.

## Core Concept

In Rails, when a request is made:

1. The router matches the URL.
2. The request is sent to a controller action.
3. The controller action renders a template.
4. The rendered HTML is sent back to the browser.

By default, Rails looks for a template file inside:

app/views/controller_name/action_name.html.erb

If the controller is `WelcomeController` and the action is `index`, Rails expects:

app/views/welcome/index.html.erb

## Syntax

### Controller with Action

```ruby
class WelcomeController < ApplicationController
  def index
  end
end
```

### Template File Location

Create file:

app/views/welcome/index.html.erb

Example content:

```erb
<h1>Welcome to my application</h1>
```

### Adding Route

Open config/routes.rb:

```ruby
get 'welcome/index'
```

Or set it as root route:

```ruby
root 'welcome#index'
```

## Example

1. Generate controller:

```bash
rails g controller welcome index
```

2. Start server:

```bash
rails server
```

3. Visit in browser:

[http://localhost:3000/welcome/index](http://localhost:3000/welcome/index)

If root route is defined:

[http://localhost:3000](http://localhost:3000)

Rails processes the request through `WelcomeController#index` and renders the `index.html.erb` template.

## Important Points

* Controller name must match view folder name.
* Action name must match template file name.
* Routes must be defined to access controller actions.
* Rails automatically renders the template if no explicit `render` is written.
* The terminal logs show which controller and action are processing the request.
* Root route defines the default homepage of the application.

## Comparison

| Component         | Responsibility                |
| ----------------- | ----------------------------- |
| Route             | Maps URL to controller action |
| Controller Action | Handles request logic         |
| Template (View)   | Displays content to the user  |

Understanding the relationship between routes, controllers, and templates is essential for building functional Rails applications.

# Models, Active Record, and Generating the First Model in Rails

## Introduction

In Ruby on Rails, a Model represents the data and business logic of the application. It is a core part of the MVC (Model-View-Controller) architecture.

Rails uses Active Record as its ORM (Object Relational Mapping) layer. When a model is generated, Rails automatically creates a corresponding migration file that defines the database table structure.

## Core Concept

In MVC architecture:

* Model → Manages data and business logic
* View → Handles presentation
* Controller → Handles request flow

A Model:

* Represents a database table.
* Handles CRUD (Create, Read, Update, Delete) operations.
* Applies validations.
* Manages relationships between tables.

Active Record allows developers to interact with database records using Ruby instead of writing raw SQL.

### Convention over Configuration

Rails follows naming conventions:

* Model name → Singular (Student)
* Table name → Plural (students)

Rails automatically maps the `Student` model to the `students` table.

## Generating a Model

### Syntax

```bash
rails generate model Student first_name:string last_name:string email:string
```

or

```bash
rails g model Student first_name:string last_name:string email:string
```

This command creates:

* app/models/student.rb
* db/migrate/TIMESTAMP_create_students.rb

## Migration Structure

Example migration file:

```ruby
class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
```

Each migration file contains a unique timestamp to maintain execution order.

### Running Migration

```bash
rails db:migrate
```

This creates the `students` table in the database.

You can verify the structure inside:

```
db/schema.rb
```

## Model Structure

```ruby
class Student < ApplicationRecord
end
```

Models inherit from `ApplicationRecord`, which connects them to Active Record.

## CRUD Operations Example

### Create

```ruby
Student.create(first_name: "Rahul", last_name: "Sharma", email: "rahul@example.com")
```

### Read

```ruby
Student.all
Student.find(1)
Student.where(first_name: "Rahul")
```

### Update

```ruby
student = Student.find(1)
student.update(email: "new@example.com")
```

### Delete

```ruby
Student.find(1).destroy
```

## Timestamps

When `t.timestamps` is included in migration:

* `created_at` is set automatically when a record is created.
* `updated_at` changes whenever the record is updated.

## Validations Example

```ruby
class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
```

Validations ensure data integrity before saving records.

## Important Points

* Always use singular names for models.
* Rails automatically pluralizes table names.
* Every Active Record model typically requires a migration.
* Each migration has a unique timestamp.
* Run `rails db:migrate` to apply schema changes.
* Schema file reflects the current database structure.
* Models handle business logic and validations.

## Comparison

| Component      | Responsibility                      |
| -------------- | ----------------------------------- |
| Model          | Represents table and business logic |
| Migration      | Defines database table structure    |
| Active Record  | Handles database interaction        |
| Database Table | Stores actual data                  |

Using Rails generators ensures consistent naming, automatic migration creation, and structured database integration.

# Rails Migrations: Add, Remove, Rename and Rollback

## Introduction

Migrations in Rails are used to create and modify database tables. After generating a model, Rails creates a migration file to define the table structure. Migrations can also be used later to update existing tables by adding, removing, or renaming columns.

## Core Concept

A migration is a Ruby class that changes the database schema.

Migrations allow you to:

* Create tables
* Add new columns
* Remove existing columns
* Rename columns
* Roll back changes

Each migration file contains a unique timestamp so Rails can run them in order.

Migrations must be executed using Rails commands to apply changes to the database.

## Syntax

### Run Pending Migrations

```bash
rails db:migrate
```

Runs all migrations that have not yet been executed.

### Rollback Last Migration

```bash
rails db:rollback
```

Reverts the most recently executed migration.

### Generate Migration to Add Column

```bash
rails generate migration AddAddressToStudents address:string
```

Example migration file:

```ruby
class AddAddressToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :address, :string
  end
end
```

### Generate Migration to Remove Column

```bash
rails generate migration RemoveAddressFromStudents address:string
```

Example:

```ruby
class RemoveAddressFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :address, :string
  end
end
```

### Generate Migration to Rename Column

```bash
rails generate migration RenameNameToFullNameInStudents
```

Example:

```ruby
class RenameNameToFullNameInStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :name, :full_name
  end
end
```

After generating any migration, run:

```bash
rails db:migrate
```

## Example

Suppose the students table initially has:

* first_name
* last_name
* email

To add address and contact_number:

```bash
rails generate migration AddDetailsToStudents address:string contact_number:string
rails db:migrate
```

To remove contact_number:

```bash
rails generate migration RemoveContactNumberFromStudents contact_number:string
rails db:migrate
```

To rename first_name to full_name:

```bash
rails generate migration RenameFirstNameToFullNameInStudents
rails db:migrate
```

To undo the last migration:

```bash
rails db:rollback
```

## Important Points

* Always run `rails db:migrate` after generating a migration.
* `rails db:rollback` reverts the last migration only.
* Each migration has a unique timestamp.
* Migration files define schema changes, not data changes.
* Schema updates are reflected in db/schema.rb.
* Active Record models usually require corresponding database tables.

## Comparison

| Command           | Purpose                  |
| ----------------- | ------------------------ |
| rails db:migrate  | Apply pending migrations |
| rails db:rollback | Revert last migration    |
| add_column        | Add new column           |
| remove_column     | Remove existing column   |
| rename_column     | Rename column            |

Migrations provide a controlled and versioned way to manage database structure changes in Rails applications.

# Resource Controller and Resource Routing in Rails

## Introduction

In Rails, a resource represents an object that users can access through a URI and perform CRUD (Create, Read, Update, Delete) operations on. In most cases, a resource corresponds to a database table represented by a model and managed through a controller.

A resource controller is a controller that follows RESTful conventions and works with resource routing to automatically generate standard CRUD routes.

## Core Concept

A resource is typically:

* A database table (e.g., students)
* Represented by a model (Student)
* Managed through a controller (StudentsController)

When you define a controller as a resource in routes, Rails automatically creates routes for the seven standard RESTful actions:

* index
* show
* new
* create
* edit
* update
* destroy

This automatic generation of routes is known as resource routing.

Controller naming convention:

* Model → Singular (Student)
* Table → Plural (students)
* Resource Controller → Plural (StudentsController)

## Syntax

### Create Controller Manually

Create file inside:

app/controllers/students_controller.rb

```ruby
class StudentsController < ApplicationController
end
```

### Define Resource in Routes

Open config/routes.rb and add:

```ruby
resources :students
```

### View Generated Routes

```bash
rails routes | grep students
```

## Example

After adding:

```ruby
resources :students
```

Rails generates routes similar to:

| HTTP Verb | Path               | Action  |
| --------- | ------------------ | ------- |
| GET       | /students          | index   |
| GET       | /students/new      | new     |
| POST      | /students          | create  |
| GET       | /students/:id      | show    |
| GET       | /students/:id/edit | edit    |
| PATCH/PUT | /students/:id      | update  |
| DELETE    | /students/:id      | destroy |

Each route is associated with a specific HTTP verb such as GET, POST, PATCH, PUT, or DELETE.

Note: Both PATCH and PUT are used for updating records, with minor differences that are discussed separately.

## Important Points

* Resource controllers should be named in plural form.
* `resources :students` generates seven standard routes automatically.
* Each route maps to a controller action.
* If resources are not used, routes must be defined manually.
* Technically, you can define a resource without a model or table, but it is not recommended.
* Resource routing simplifies CRUD implementation.

## Comparison

| Without Resource Routing | With Resource Routing           |
| ------------------------ | ------------------------------- |
| Routes defined manually  | Routes generated automatically  |
| More boilerplate code    | Cleaner and shorter routes file |
| Higher chance of errors  | Standardized RESTful structure  |

Resource controllers and resource routing provide a structured and efficient way to manage CRUD operations in Rails applications.

# Seeding Data and Listing Records in Rails

## Introduction

Before implementing resource controller actions, it is useful to populate the database with initial or dummy data. Rails provides a seed file that allows developers to insert predefined records into the database.

## Core Concept

The seed file is located at:

```
db/seeds.rb
```

It contains plain Ruby code and is used to insert initial data into the database.

Seeding is helpful when:

* You need sample data for development.
* You want predefined records available after setup.
* You want to test resource controller actions like index.

Seeds are executed using a Rails command and populate the database accordingly.

## Syntax

### Add Data in seeds.rb

```ruby
Student.create(
  first_name: "Rahul",
  last_name: "Sharma",
  email: "rahul@example.com"
)
```

### Run Seeds

```bash
rails db:seed
```

### Reset and Reseed Database (Optional)

```bash
rails db:reset
```

or

```bash
rails db:drop db:create db:migrate db:seed
```

## Example

### Creating Multiple Records

```ruby
5.times do |i|
  Student.create(
    first_name: "Student#{i + 1}",
    last_name: "Test",
    email: "student#{i + 1}@example.com"
  )
end
```

Run:

```bash
rails db:seed
```

This creates multiple student records in the database.

## Listing Records in Controller

Inside `StudentsController`:

```ruby
class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
end
```

Corresponding view:

```erb
<h1>All Students</h1>

<ul>
  <% @students.each do |student| %>
    <li><%= student.first_name %> <%= student.last_name %></li>
  <% end %>
</ul>
```

Visit:

```
http://localhost:3000/students
```

This will display all seeded student records.

## Important Points

* Seed file contains plain Ruby code.
* Use `rails db:seed` to execute it.
* Seeds are commonly used in development.
* Resource controller index action retrieves all records.
* Ensure the model and migration exist before seeding.
* Re-running seeds may create duplicate records unless handled carefully.

## Comparison

| Method              | Purpose                 |
| ------------------- | ----------------------- |
| rails db:seed       | Insert predefined data  |
| Student.create      | Create single record    |
| loop or times block | Create multiple records |
| Student.all         | Retrieve all records    |

Seeding simplifies development by providing ready-to-use data for testing resource controllers and CRUD operations.

# Implementing Index Action and Listing Records in Rails

## Introduction

After seeding the database with student records, the next step is to display those records in the browser. In a RESTful resource controller, the `index` action is responsible for listing all records of a model.

## Core Concept

The `index` action:

* Fetches all records from the database.
* Stores them in an instance variable.
* Makes the data available to the view.

Instance variables (starting with `@`) are accessible inside the corresponding view template.

Flow:

1. Browser sends request to `/students`.
2. Router maps request to `StudentsController#index`.
3. Controller fetches records.
4. View renders the list of students.

## Syntax

### Controller Implementation

Open:

```
app/controllers/students_controller.rb
```

```ruby
class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
end
```

### Create View File

Create file:

```
app/views/students/index.html.erb
```

Example template:

```erb
<h1>All Students</h1>

<table border="1">
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    <% @students.each do |student| %>
      <tr>
        <td><%= student.first_name %></td>
        <td><%= student.last_name %></td>
        <td><%= student.email %></td>
      </tr>
    <% end %>
  </tbody>
</table>
```

## Example

Ensure resource routing is defined in `config/routes.rb`:

```ruby
resources :students
```

Start the server:

```bash
rails server
```

Visit in browser:

```
http://localhost:3000/students
```

All seeded student records will be displayed in a table format.

## Important Points

* Use `Student.all` to fetch all records.
* Use instance variable (`@students`) to pass data to the view.
* Use ERB tags:

  * `<% %>` for Ruby logic.
  * `<%= %>` for output display.
* The index route is automatically generated using `resources :students`.
* The view file name must match the action name.

## Comparison

| Component  | Responsibility                   |
| ---------- | -------------------------------- |
| Route      | Maps `/students` to index action |
| Controller | Fetches data using model         |
| View       | Displays data in browser         |

The `index` action is the foundation for displaying resource collections in Rails applications.

# New and Create Actions with Form in Rails

## Introduction

To allow users to submit data through the browser, a form must be created. In a RESTful resource controller, the `new` action displays the form and the `create` action processes submitted data and saves it to the database.

## Core Concept

The flow for creating a record:

1. User visits `/students/new`.
2. `new` action initializes a new object.
3. A form is displayed in the browser.
4. User submits the form.
5. `create` action receives parameters.
6. Record is saved to the database.
7. User is redirected.

The model is a Ruby class (Active Record model), so creating a new student means creating an object of the `Student` class.

## Syntax

### Controller (students_controller.rb)

```ruby
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
```

### View (app/views/students/new.html.erb)

```erb
<h1>New Student</h1>

<%= form_with model: @student, local: true do |form| %>
  <div>
    <%= form.label :first_name %>
    <%= form.text_field :first_name %>
  </div>

  <div>
    <%= form.label :last_name %>
    <%= form.text_field :last_name %>
  </div>

  <div>
    <%= form.label :email %>
    <%= form.email_field :email %>
  </div>

  <div>
    <%= form.submit "Create Student" %>
  </div>
<% end %>
```

## Example

With `resources :students` defined in `routes.rb`, Rails automatically provides:

* GET `/students/new` → new action
* POST `/students` → create action

After submitting the form, the data is saved and the user is redirected to `/students`.

## Important Points

* `new` initializes the object but does not save it.
* `create` saves the object to the database.
* `form_with model: @student` automatically sets the correct route.
* Strong parameters (`permit`) are required for security.
* If saving fails, render `:new` to show errors.
* Resource routing must be defined using `resources :students`.

## Comparison

| Action        | Purpose                   |
| ------------- | ------------------------- |
| new           | Displays form             |
| create        | Processes form submission |
| Student.new   | Initializes object        |
| @student.save | Persists data in database |

The `new` and `create` actions form the foundation for accepting user input in a Rails resource controller.

# Creating Records with Create Action and Strong Parameters

## Introduction

To store user-submitted data into the database, a `create` action is implemented inside the resource controller. This action accepts form parameters, saves them using the model, and handles success or failure responses appropriately.

## Core Concept

When a user submits a form:

1. The form sends a POST request to the controller.
2. The `create` action initializes a new model object.
3. Submitted parameters are filtered using Strong Parameters.
4. The record is saved to the database.
5. Based on success or failure:

   * Redirect to another page (usually index or show).
   * Re-render the form if validations fail.

Strong Parameters ensure that only permitted attributes are saved, protecting against mass assignment vulnerabilities.

## Syntax

```ruby
# app/controllers/students_controller.rb

def create
  @student = Student.new(student_params)

  if @student.save
    redirect_to students_path
  else
    render :new
  end
end

private

def student_params
  params.require(:student).permit(:first_name, :last_name, :email)
end
```

## Example

### 1. Form (new.html.erb)

```erb
<%= form_with model: @student do |form| %>
  <%= form.label :first_name %>
  <%= form.text_field :first_name %>

  <%= form.label :last_name %>
  <%= form.text_field :last_name %>

  <%= form.label :email %>
  <%= form.email_field :email %>

  <%= form.submit "Create Student" %>
<% end %>
```

### 2. Model Validation

```ruby
# app/models/student.rb

class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
```

### 3. Flow

* User fills form.
* Form sends POST request to `/students`.
* `create` action runs.
* If saved successfully → redirect to index.
* If validation fails → render `new` template again.

## Important Points

* `Student.new` only initializes the object.
* `@student.save` persists it to the database.
* `redirect_to` sends a new request.
* `render :new` does not send a new request; it re-renders the template.
* Strong Parameters prevent unauthorized fields from being saved.
* Always define `student_params` as a private method.
* Validations should be defined inside the model, not the controller.

## Comparison

### Redirect vs Render

| Feature     | redirect_to         | render :new        |
| ----------- | ------------------- | ------------------ |
| New Request | Yes                 | No                 |
| URL Changes | Yes                 | No                 |
| Used When   | Save successful     | Validation fails   |
| Data Reload | Fresh request cycle | Same request cycle |

### Without Strong Parameters vs With Strong Parameters

| Without Strong Params         | With Strong Params                |
| ----------------------------- | --------------------------------- |
| Security risk                 | Secure filtering                  |
| Allows all params             | Allows only permitted fields      |
| Vulnerable to mass assignment | Protected against mass assignment |

# Implementing Show Action in Rails Resource Controller

## Introduction

The `show` action is used to display a single record from the database. It retrieves a specific record using its `id` and renders its details in a dedicated view template.

## Core Concept

* Each resource in Rails has a `show` route.
* The route includes the record ID (`/students/:id`).
* The controller fetches the record using `find`.
* The corresponding `show.html.erb` template displays the data.
* `link_to` is used to generate navigation links.

## Syntax

```ruby
# app/controllers/students_controller.rb

def show
  @student = Student.find(params[:id])
end
```

## Example

### 1. Add View Link in Index Template

```erb
<!-- app/views/students/index.html.erb -->

<td>
  <%= link_to "View", student_path(student) %>
</td>
```

### 2. Create Show Template

```erb
<!-- app/views/students/show.html.erb -->

<h2>Student Details</h2>

<p>
  <strong>First Name:</strong>
  <%= @student.first_name %>
</p>

<p>
  <strong>Last Name:</strong>
  <%= @student.last_name %>
</p>

<p>
  <strong>Email:</strong>
  <%= @student.email %>
</p>

<%= link_to "Back", students_path %>
```

### 3. Add New Student Link in Index

```erb
<%= link_to "New Student", new_student_path %>
```

## Flow

1. User clicks on "View" link.
2. Rails routes to `/students/:id`.
3. `show` action runs.
4. `Student.find(params[:id])` fetches the record.
5. `show.html.erb` renders student details.

## Important Points

* `params[:id]` contains the ID from the URL.
* `Student.find` raises an error if record does not exist.
* The template name must match the action (`show.html.erb`).
* `link_to` generates an HTML anchor (`<a>` tag).
* Resourceful routing automatically creates the `show` route.

## Comparison

### link_to vs Manual Anchor Tag

| Feature        | link_to Helper | Manual `<a>` Tag |
| -------------- | -------------- | ---------------- |
| URL Helpers    | Yes            | No               |
| Cleaner Syntax | Yes            | No               |
| Dynamic Paths  | Yes            | Manual handling  |
| Rails Friendly | Yes            | Limited          |

### find vs where

| Method | Returns                            | Raises Error if Not Found |
| ------ | ---------------------------------- | ------------------------- |
| find   | Single record                      | Yes                       |
| where  | Collection (ActiveRecord Relation) | No                        |

This completes the implementation of displaying a single resource record using the `show` action.

# Implementing Edit Action in Rails Resource Controller

## Introduction

The `edit` action is used to open a form for modifying an existing record. It retrieves a specific record from the database and pre-fills the form with current data so that users can update it.

## Core Concept

* The `edit` route includes the record ID (`/students/:id/edit`).
* The controller fetches the record using `find`.
* The `edit.html.erb` template displays a form populated with existing values.
* The same form structure used for `new` can be reused for `edit`.
* Submitting the form sends a PATCH or PUT request to the `update` action.

## Syntax

```ruby
# app/controllers/students_controller.rb

def edit
  @student = Student.find(params[:id])
end
```

## Example

### 1. Add Edit Link in Index Template

```erb
<!-- app/views/students/index.html.erb -->

<td>
  <%= link_to "Edit", edit_student_path(student) %>
</td>
```

### 2. Create Edit Template

```erb
<!-- app/views/students/edit.html.erb -->

<h2>Edit Student</h2>

<%= form_with model: @student do |form| %>
  <%= form.label :first_name %>
  <%= form.text_field :first_name %>

  <%= form.label :last_name %>
  <%= form.text_field :last_name %>

  <%= form.label :email %>
  <%= form.email_field :email %>

  <%= form.submit "Update Student" %>
<% end %>
```

### 3. Flow

1. User clicks on "Edit" link.
2. Rails routes to `/students/:id/edit`.
3. `edit` action runs.
4. `Student.find(params[:id])` fetches the record.
5. Form loads with existing student data.
6. On submit, request is sent to `update` action.

## Important Points

* `params[:id]` identifies which record to edit.
* The form automatically switches to PATCH when editing an existing record.
* The same form structure can be reused for both `new` and `edit`.
* The `edit` action does not save data; it only prepares the form.
* Actual database update happens in the `update` action.

## Comparison

### new vs edit

| Feature      | new Action        | edit Action              |
| ------------ | ----------------- | ------------------------ |
| Purpose      | Create new record | Modify existing record   |
| Object State | Unsaved object    | Existing database record |
| Route        | /students/new     | /students/:id/edit       |
| HTTP Method  | GET               | GET                      |

### edit vs update

| Action | Responsibility                 |
| ------ | ------------------------------ |
| edit   | Load form with existing data   |
| update | Save modified data to database |

This completes the implementation of opening an edit form for an existing resource record.

# Implementing Update Action in Rails Resource Controller

## Introduction

The `update` action is responsible for modifying an existing record in the database. It receives updated form data, applies changes to the record, and saves them.

## Core Concept

* The `update` action handles PATCH or PUT requests.
* The record must first be located using its `id`.
* Submitted parameters are filtered using Strong Parameters.
* If update succeeds → redirect.
* If update fails → re-render the edit form.

## Syntax

```ruby
# app/controllers/students_controller.rb

def update
  @student = Student.find(params[:id])

  if @student.update(student_params)
    redirect_to students_path
  else
    render :edit
  end
end
```

## Example

### Redirect to Show Page Instead of Index

```ruby
def update
  @student = Student.find(params[:id])

  if @student.update(student_params)
    redirect_to student_path(@student)
  else
    render :edit
  end
end
```

### Strong Parameters

```ruby
private

def student_params
  params.require(:student).permit(:first_name, :last_name, :email)
end
```

## Flow

1. User clicks "Edit".
2. Edit form loads with existing data.
3. User modifies fields.
4. Form submits PATCH request to `/students/:id`.
5. `update` action runs.
6. Record is updated in database.
7. Redirect occurs based on success.

## Important Points

* `Student.find(params[:id])` fetches the record.
* `update` both assigns attributes and saves the record.
* If validations fail, `update` returns `false`.
* `render :edit` keeps the same object with validation errors.
* PATCH and PUT are HTTP verbs used for updating resources.
* SQL `UPDATE` query is triggered internally by ActiveRecord.

## Comparison

### update vs create

| Feature        | create     | update          |
| -------------- | ---------- | --------------- |
| Record Type    | New record | Existing record |
| HTTP Verb      | POST       | PATCH / PUT     |
| Database Query | INSERT     | UPDATE          |
| Needs ID       | No         | Yes             |

### redirect_to vs render (During Update)

| Feature     | redirect_to       | render :edit     |
| ----------- | ----------------- | ---------------- |
| New Request | Yes               | No               |
| Used When   | Update successful | Validation fails |
| URL Changes | Yes               | No               |

This completes the implementation of modifying existing records using the `update` action.

# Implementing Destroy Action in Rails Resource Controller

## Introduction

The `destroy` action is used to permanently delete an existing record from the database. It removes the selected resource using its ID and then redirects the user to an appropriate page.

## Core Concept

* The `destroy` route requires a specific resource ID.
* The controller finds the record using `find`.
* The `destroy` method removes the record from the database.
* After deletion, the user is redirected (commonly to the index page).
* The delete request must use the correct HTTP method (`DELETE`).

## Syntax

```ruby
# app/controllers/students_controller.rb

def destroy
  @student = Student.find(params[:id])
  @student.destroy
  redirect_to students_path
end
```

## Example

### 1. Add Delete Link in Index Template

```erb
<!-- app/views/students/index.html.erb -->

<td>
  <%= link_to "Delete", student_path(student), method: :delete, data: { confirm: "Are you sure?" } %>
</td>
```

### 2. Flow

1. User clicks the "Delete" link.
2. Rails sends a DELETE request to `/students/:id`.
3. `destroy` action runs.
4. `Student.find(params[:id])` fetches the record.
5. `@student.destroy` removes it from the database.
6. User is redirected to the students index page.

## Important Points

* `params[:id]` identifies the record to delete.
* `destroy` permanently removes the record from the database.
* The `method: :delete` option is required in `link_to`.
* Without specifying the HTTP method, Rails defaults to GET and deletion will not work.
* `data: { confirm: "Are you sure?" }` adds a confirmation dialog.
* After deletion, redirection is necessary to avoid errors.

## Comparison

### destroy vs delete

| Method  | Runs Callbacks | Recommended Usage |
| ------- | -------------- | ----------------- |
| destroy | Yes            | Yes               |
| delete  | No             | Use cautiously    |

### Member vs Collection Actions

| Type       | Requires ID | Example Actions             |
| ---------- | ----------- | --------------------------- |
| Member     | Yes         | show, edit, update, destroy |
| Collection | No          | index, new, create          |

This completes the implementation of deleting an existing resource record using the `destroy` action.

# Partials in Ruby on Rails

## Introduction

Partials are reusable view templates in Rails used to extract common UI components into separate files. They help reduce duplication and improve maintainability by allowing shared code to be rendered across multiple views.

## Core Concept

* A partial is a view file that starts with an underscore (`_`).
* Partials are rendered inside other templates using the `render` method.
* They are commonly used for forms, shared components, and repeated UI elements.
* Local variables can be passed to partials.

## Syntax

```erb
<%= render "form" %>
```

Rendering with locals:

```erb
<%= render "form", student: @student %>
```

Partial file naming:

```
_app/views/students/_form.html.erb
```

## Example

### 1. Create Partial File

```erb
<!-- app/views/students/_form.html.erb -->

<%= form_with model: student do |form| %>
  <%= form.label :first_name %>
  <%= form.text_field :first_name %>

  <%= form.label :last_name %>
  <%= form.text_field :last_name %>

  <%= form.label :email %>
  <%= form.email_field :email %>

  <%= form.submit %>
<% end %>
```

### 2. Use Partial in New Template

```erb
<!-- app/views/students/new.html.erb -->

<h2>New Student</h2>
<%= render "form", student: @student %>
```

### 3. Use Partial in Edit Template

```erb
<!-- app/views/students/edit.html.erb -->

<h2>Edit Student</h2>
<%= render "form", student: @student %>
```

## Passing Local Variables

```erb
<%= render partial: "form", locals: { student: @student } %>
```

Inside the partial, `student` will be available as a local variable.

## Important Points

* Partial file names must begin with an underscore (`_form.html.erb`).
* When rendering, omit the underscore.
* Partials improve code reusability.
* Locals must be explicitly passed if required.
* Partials can be rendered from different folders using full path.

## Comparison

### Regular Template vs Partial

| Feature         | Regular Template    | Partial                     |
| --------------- | ------------------- | --------------------------- |
| File Prefix     | No underscore       | Starts with `_`             |
| Reusability     | Limited             | High                        |
| Used For        | Full page rendering | Shared components           |
| Render Required | Automatic by action | Must be explicitly rendered |

### Rendering Styles

| Syntax Style  | Example                                                        |
| ------------- | -------------------------------------------------------------- |
| Short Form    | `<%= render "form" %>`                                         |
| With Locals   | `<%= render "form", student: @student %>`                      |
| Explicit Form | `<%= render partial: "form", locals: { student: @student } %>` |

Partials are commonly used for shared forms such as combining `new` and `edit` views into a single reusable template.

---

# Resource Controller Deep Understanding + Flash Messages

## Resource Controller Structure (Students Example)

A resource controller follows RESTful conventions and typically includes:

### Collection Actions (No ID Required)

* `index` – list all students
* `new` – show form for new student
* `create` – save new student to database

These actions work on a collection of records.
They do not require `params[:id]`.

---

### Member Actions (ID Required)

* `show` – display one specific student
* `edit` – open form for existing student
* `update` – save changes to existing student
* `destroy` – delete a student permanently

These require:

```ruby
def set_student
  @student = Student.find(params[:id])
end
```

---

# HTTP Verb Mapping in Resource Controller

| Action  | HTTP Verb | Requires ID | Template Needed |
| ------- | --------- | ----------- | --------------- |
| index   | GET       | No          | Yes             |
| new     | GET       | No          | Yes             |
| create  | POST      | No          | No (redirect)   |
| show    | GET       | Yes         | Yes             |
| edit    | GET       | Yes         | Yes             |
| update  | PATCH/PUT | Yes         | No (redirect)   |
| destroy | DELETE    | Yes         | No (redirect)   |

`create`, `update`, and `destroy` generally redirect instead of rendering views directly.

---

# Flash Messages in Rails

Flash messages provide temporary feedback to users after an action such as create, update, or delete.

They are stored in the session and available on the next request.

---

## Create with Flash

```ruby
def create
  @student = Student.new(student_params)

  if @student.save
    flash[:notice] = "Student has been created successfully."
    redirect_to students_path
  else
    render :new
  end
end
```

---

## Update with Flash

```ruby
def update
  @student = Student.find(params[:id])

  if @student.update(student_params)
    flash[:notice] = "Student has been updated successfully."
    redirect_to students_path
  else
    render :edit
  end
end
```

---

## Destroy with Flash

```ruby
def destroy
  @student = Student.find(params[:id])
  @student.destroy

  flash[:notice] = "Student has been deleted successfully."
  redirect_to students_path
end
```

---

# Display Flash in Layout

Add inside `application.html.erb` or `index.html.erb`:

```erb
<% if flash[:notice] %>
  <p><%= flash[:notice] %></p>
<% end %>
```

Now whenever create/update/destroy runs successfully and redirects, the message will appear.

---

# Strong Parameters Reminder

```ruby
private

def student_params
  params.require(:student).permit(:first_name, :last_name, :email)
end
```

Strong parameters protect your model from unwanted attribute assignment.

---

# Key Concept Summary

* Collection actions → operate on all records → no ID required
* Member actions → operate on single record → ID required
* `create`, `update`, `destroy` → usually redirect
* Flash messages → show temporary feedback after redirect
* Strong parameters → required for security

Next step logically: using `before_action` to remove repetition in `show`, `edit`, `update`, and `destroy` actions.
