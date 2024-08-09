# Midwest Buffet

A collection of exercises to practice Ruby, and test-driven design (TDD).

## How to Run

In order to complete these exercises create a class for each of the class tests in the `spec` directory.

Navigate to the `midwest-buffet` directory in your terminal, and then run your first test:

```
customer_spec.rb
```

If you get an error regarding a certain gem not being installed, you may need to run the following command from your terminal:

```
bundle install
```

Follow the errors that your test provides until the test passes. Then, unskip the next test by removing the `x`. Continue until all tests pass for each class.

## Suggested Order

* `customer_spec.rb`
* `buffet_dish_spec.rb`
* `buffet_side_spec.rb`
* `buffet_dessert_spec.rb`
* `buffet_spec.rb`
* `buffet_line_spec.rb`

## Extra Challenges

### Testing with RSpec

* [How to use RSpec without Rails](https://gist.github.com/ap2322/d8081e38d448acccf2cdc25308be565f) for these exercises.
* [You can check out one of our tutorials about RSpec](http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_and_bdd.html)
  or [this blog post](http://gregelizondo.github.io/2014/03/03/getting-started-with-rspec-and-unit-testing.html)

[//]: # (### The Dreaded `if` Statement)

[//]: # (Can you complete implementations of each of the creatures without using `if`)

[//]: # (statements? Think about how removing them affects your code. Remember that)

[//]: # (a `case` is just a different form of `if`, so don't use it.)

### Grow the Buffet!

Can you add two new classes to the repository? How about a BuffetManager? Add rspec
tests exercising some of the following concepts:

* Passing data into `initialize`
* Using methods to change the internal state of an instance
* Using methods to query the internal state of an instance
* Functionality that necessitates the internal use of an Array
