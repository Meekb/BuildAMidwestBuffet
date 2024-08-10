# Build A Midwest Buffet

A collection of exercises to practice Ruby, and test-driven design (TDD). The project serves as both a practical example of writing and organizing Ruby tests and as a playful nod to Midwest culture, where buffet lines are a beloved tradition.

## How to Run
Clone down repo

Create a class file in `lib` for each class test in the `spec` directory.

Navigate to the `midwest-buffet` directory in your terminal, and then run your first test:
```
rspec spec/buffet_side_spec.rb
```

Follow the errors that your test provides until the test passes. Unskip the next test by removing the `x`. Continue until all tests pass for each class.

## Test Completion Order
The classes interact as you progress. Follow the order below to build a solid foundation for each component and ensure that dependencies between classes are correctly handled:

* `buffet_dish_spec.rb`
* `buffet_side_spec.rb`
* `buffet_dessert_spec.rb`
* `buffet_spec.rb`
* `customer_spec.rb`
* `buffet_line_spec.rb`

## Add to the Buffet!

Can you add new classes to the repository? 
How about a BuffetManager?
Does a Customer `sample_food` from the `buffet`?
`return manager.eject_customer if customer.sample_food`
The possibilities are endless!
