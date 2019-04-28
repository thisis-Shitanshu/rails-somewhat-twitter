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