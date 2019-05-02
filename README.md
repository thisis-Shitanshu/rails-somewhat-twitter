# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).


## Undoing things: rails command
- generate command:
```
$ rails generate controller StaticPages home help
$ rails destroy  controller StaticPages home help
```
- model command:
```
$ rails generate model User name:string email:string
$ rails destroy model User
```
- Undoing migrations:
```
$ rails db:migrate
$ rails db:rollback
```
- To go all the way back to the beginning:
```
$ rails db:migrate VERSION=0
```


## Test-driven development:
- A testing technique in which the programmer writes failing tests first;
    - and then writes the application code to get the tests to pass.

## When to test:
- Automated tests has three main benefits:
    1. Tests protect against regressions;
        - where a functioning feature stops working for some reason.
    1. Tests allow code to be refactored (i.e., changing its form without changing its function) with greater confidence.
    1. Tests act as a client for the application code;
        - thereby helping determine its design and its interface with other parts of the system.

- **When we should test first (or test at all), TDD:**
    - When a test is especially short or simple compared to the application code it tests, lean toward writing the test first.
    - When the desired behavior isn’t yet crystal clear, lean toward writing the application code first, then write a test to codify the result.
    - Because security is a top priority, err on the side of writing tests of the security model first.
    - Whenever a bug is found, write a test to reproduce it and protect against regressions, then write the application code to fix it.
    - Lean against writing tests for code (such as detailed HTML structure) likely to change in the future.
    - Write tests before refactoring code, focusing on testing error-prone code that’s especially likely to break.

- The guidelines above mean that we’ll usually write controller and model tests first and integration tests (which test functionality across models, views, and controllers) second.
    - Integration tests allow us to simulate the actions of a user interacting with our application using a web browser.


## Finish static pages
- The **rails** script generates a new controller with **rails generate controller ControllerName <optional action names>**.
- New routes are defined in the file config/routes.rb.
- Rails views can contain static HTML or embedded Ruby (ERb).
- Test-driven development uses a “Red, Green, Refactor” cycle.


## Rails-flavored Ruby:
- Ruby won’t interpolate into single-quoted strings.
- To mutate the array, use the corresponding “bang” methods (so-called because the exclamation point is usually pronounced “bang” in this context).
    ```ruby
    >> a
    => [42, 8, 17]
    >> a.sort!
    => [8, 17, 42]
    >> a
    => [8, 17, 42]
    ```

- shovel operator:
    ```ruby
    >> a << "foo" << "bar"  # Chaining array pushes
    => [42, 8, 17, 6, 7, "foo", "bar"]
    ```

- Convert array to string:
    ```ruby
    >> a
    => [42, 8, 17, 6, 7, "foo", "bar"]
    >> a.join   # Join on nothing.
    => "4281767foobar"
    >> a.join(', ') # Join on comma-space.
    => "42, 8, 17, 6, 7, foo, bar"
    ```

- Ranges:
    ```ruby
    >> 0..9
    => 0..9
    >> (0..9).to_a  # Use parentheses to call to_a on the range.
    => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    >> a = %w[foo bar baz quux] # Use %w to make a string array.
    => ["foo", "bar", "baz", "quux"]
    >> a[0..2]
    => ["foo", "bar", "baz"]

    >> ('a'..'e').to_a
    => ["a", "b", "c", "d", "e"]
    ```

- Block:
    ```ruby
    >> (1..5).each { |i| puts 2 * i }
    2
    4
    6
    8
    10
    => 1..5

    >> (1..5).each do |number|
    ?>   puts 2 * number
    >>   puts '--'
    >> end
    2
    --
    4
    --
    6
    --
    8
    --
    10
    --
    => 1..5

    >> 3.times { puts "Betelgeuse!" }   # 3.times takes a block with no variables.
    "Betelgeuse!"
    "Betelgeuse!"
    "Betelgeuse!"
    => 3
    >> (1..5).map { |i| i**2 }  # The ** notation is for 'power'.
    => [1, 4, 9, 16, 25]
    >> %w[a b c]    # Recall that %w makes string arrays.
    => ["a", "b", "c"]
    >> %w[a b c].map { |char| char.upcase }
    => ["A", "B", "C"]
    >> %w[A B C].map { |char| char.downcase }
    => ["a", "b", "c"]

    >> %w[A B C].map(&:downcase)
    => ["a", "b", "c"]
    ```

- Hashes and symbols:
    ```ruby
    >> user = {}    # {} is an empty hash.
    => {}
    >> user["first_name"] = "Michael"   # Key "first_name", value "Michael"
    => "Michael"
    >> user["last_name"] = "Hartl"  # Key "last_name", value "Hartl"
    => "Hartl"
    >> user["first_name"]   # Element access is like arrays.
    => "Michael"
    >> user     # A literal representation of the hash
    => {"last_name"=>"Hartl", "first_name"=>"Michael"}
    
    
    # Hashrocket
    >> user = { "first_name" => "Michael", "last_name" => "Hartl" }
    => {"last_name"=>"Hartl", "first_name"=>"Michael"}
    ```

- Symbol: Symbols are basically strings without all the extra baggage.
    ```ruby
    >> "name".split('')
    => ["n", "a", "m", "e"]
    >> :name.split('')
    NoMethodError: undefined method "split" for :name :Symbol

    >> user = { :name => "Michael Hartl", :email => "michael@example.com" }
    => {:name=>"Michael Hartl", :email=>"michael@example.com"}
    >> user[:name]              # Access the value corresponding to :name.
    => "Michael Hartl"
    
    # Nested hashes
    >> params = {}        # Define a hash called 'params' (short for 'parameters').
    => {}
    >> params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }
    => {:name=>"Michael Hartl", :email=>"mhartl@example.com"}
    >> params
    => {:user=>{:name=>"Michael Hartl", :email=>"mhartl@example.com"}}
    >>  params[:user][:email]
    => "mhartl@example.com"

    >> flash = { success: "It worked!", danger: "It failed." }
    => {:success=>"It worked!", :danger=>"It failed."}
    >> flash.each do |key, value|
    ?>   puts "Key #{key.inspect} has value #{value.inspect}"
    >> end
    Key :success has value "It worked!"
    Key :danger has value "It failed."

    # Shortcut to print inspect:
    >> p :name
    :name
    ```

- Making model:
```ruby
$ rails generate model User name:string email:string

# In contrast to the plural convention for controller names, model names are singular: a Users controller, but a User model.
```

- Migrating up the models:
```
$ rails db:migrate
```

- Rolling back Migrations:
```
$ rails db:rollback
```

- CRUD Operations:
    - Create:
        ```
        user = User.create(name: "", email: "")
        ```
    - Read:
        ```
        User.find(1)
        User.find_yb(name: "Shitanshu")
        User.first
        User.all
        ```
    - Update:
        ```ruby
        # First
        $ user.emal = "new@emial.com"
        $ user.reload.email
        $ user.save

        # Second
        $ user.update_attributes(name: "The Dude", email: "dude@abides.org")

        # Third: Single
        $ user.update_attribute(:name, "El Duderino")

        # Forth: Time
        $ user.created_at = 1.year.ago(user.created_at)
        ```

- Rails Model Test:
    ```
    $ rails test:models
    ```
- After applying validation:
    - User can be created but if user isn’t valid, an attempt to save the user to the database automatically fails.
    - To get full error:
        ```
        $ u.errors.full_messages
        ```

    - The Active Record uniqueness validation does not guarantee uniqueness at the database level.
        - We just need to enforce uniqueness at the database level as well as at the model level.
    
## Dealing with FULL_TABLE SCAN using Database indices:
- To understand a database index, it’s helpful to consider the analogy of a book index.
    - With a book index, on the other hand, you can just look up “foobar” in the index to see all the pages containing “foobar”. A database index works essentially the same way.

- Adding migration structure to an existing model, so we need to create a migration directly using the migration generator:
    ```
    $ rails generate migration add_index_to_users_email
    $ rails db:migrate
    ```

## has_secure_password
- The ability to save a securely hashed password_digest attribute to the database.
- A pair of virtual attributes18 (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match.
- An authenticate method that returns the user when the password is correct (and false otherwise).
    - has_secure_password automatically adds an authenticate method to the corresponding model objects:
        - This method determines if a given password is valid for a particular user by computing its digest and comparing the result to password_digest in the database.

## Running a console in production:
```
$ heroku run rails console --sandbox
```

### Migrations allow us to modify our application’s data model.
- Active Record validations allow us to place constraints on the data in our models.
    - Common validations include presence, length, and format.
- Defining a database index improves lookup efficiency while allowing enforcement of uniqueness at the database level.
- We can add a secure password to a model using the built-in has_secure_password method.

## Rails environments:
- Rails comes equipped with three environments: test, development, and production.
    - The default environment for the Rails console is development.
- If you ever need to run a console in a different environment (to debug a test, for example), you can pass the environment as a parameter to the console script:
    ```
    $ rails console test
    ```

- development is the default environment for the Rails server, but you can also run it in a different environment:
    ```
    $ rails server --environment production
    ```
    - If you view your app running in production, it won’t work without a production database, which we can create by running rails db:migrate in production:
        ```
        $ rails db:migrate RAILS_ENV=production
        ```

## Following REST principle:
- Resources are typically referenced using the resource name and a unique identifier.
-  Here the show action is implicit in the type of request—when Rails’ REST features are activated, GET requests are automatically handled by the show action.

- Routing for user resouces:
```
GET	    /users	        index	    users_path	            page to list all users

GET	    /users/1	    show	    user_path(user)	        page to show user

GET	    /users/new	    new	        new_user_path	        page to make a new user (signup)

POST	/users	        create	    users_path	            create a new user

GET	    /users/1/edit	edit	    edit_user_path(user)	page to edit user with id 1

PATCH	/users/1	    update	    user_path(user)	        update user

DELETE	/users/1	    destroy	    user_path(user)	        delete user
```

## Strong parameters:
- In the controller layer.
-  This allows us to specify which parameters are required and which ones are permitted. 
    - **In addition, passing in a raw params hash as above will cause an error to be raised, so that Rails applications are now immune to mass assignment vulnerabilities by default.**
    - To facilitate the use of these parameters, it’s conventional to introduce an auxiliary method called user_params (which returns an appropriate initialization hash) and use it in place of params[:user].


# Professional-grade deployment
add an important feature to the production application to make signup secure.

## SSL in producation
- use Secure Sockets Layer (SSL) to encrypt all relevant information before it leaves the local browser.
    - Although we could use SSL on just the signup page;
        -  it’s actually easier to implement it site-wide, which has the additional benefits of securing user login and making our application immune to the critical session hijacking vulnerability.
- Although Heroku uses SSL by default, it doesn’t force browsers to use it.
    - so any users hitting our application using regular http will be interacting insecurely with the site.

```ruby
# config/environments/production.rb
    # Force all access to the app over SSL, use Strict-Transport-Security,
    # and use secure cookies.
    config.force_ssl = true
```

- At this stage;
    - we need to set up SSL on the remote server.
    - Setting up a production site to use SSL involves;
        - purchasing and configuring an SSL certificate for your domain.

- For an application running on a Heroku domain, we can piggyback on Heroku’s SSL certificate.
    - when we deploy the application, SSL will automatically be enabled.

## Production webserver
- Heroku uses a pure-Ruby webserver called WEBrick.
    - isn’t good at handling significant traffic.
    - **Replace WEBrick with Puma, an HTTP server that is capable of handling a large number of incoming requests.**
    (https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server)
    
## Production database configuration
- Setup to usePostgresSQL