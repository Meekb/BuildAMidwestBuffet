# Ruby & Ranch: Build a Midwest Buffet

A collection of exercises to practice Ruby, and test-driven design (TDD). The project serves as both a practical example of writing and organizing Ruby tests and as a playful nod to Midwest culture, where buffet lines are a beloved tradition.  

Build the buffet starting with sides, dishes, and desserts. Move along and create customers, then build them a buffet line to stand in. Finally, have the buffet serve the food to customers that are in the buffet line. Find out what happens when a customer says, "Ohp! Let me scootch by ya for the Ranch..."

This test suite is evolving. Additional classes and functionality may be added at any time. Read on to find out how you can [contribute](#contributing).

## How to Run
Fork this repo, then clone your forked copy to your machine 

`cd` into the directory for the project

Take a look at the first class file `lib/buffet_side.rb`

Navigate to the `midwest-buffet` directory in your terminal, and then run your first test:
```
rspec spec/buffet_side_spec.rb
```

Follow the errors that your test provides until the test passes. Unskip the next test by removing the `x`. Continue until all tests pass for each class.

You will need to create a class file in `lib` as you proceed through the tests in the `spec` directory.

## Test Completion Order
The classes interact as you progress. Follow the order below to build a solid foundation for each component and ensure that dependencies between classes are correctly handled:

* `buffet_side_spec.rb`
* `buffet_dish_spec.rb`
* `buffet_dessert_spec.rb`
* `customer_spec.rb`
* `buffet_line.rb`
* `buffet_spec.rb`

## Add to the Buffet!

Can you add new classes to the repository? 
How about a BuffetManager?  
Can a Customer `sample_food` from the `buffet`?  
Does the `manager.eject_customer` if `customer.sample_food` while in the `buffet.buffet_line`?

## Contributing
Contributions are welcome! If you have ideas for additional tests or improvements to the existing ones, feel free to submit a pull request. Whether it's adding more scenarios, edge-cases, or optimizing the existing tests, your contributions help make this project more robust and comprehensive.

### How to Contribute
* Fork the repository: Create a copy of this repository in your own GitHub account.
* Create a new branch: Make your changes in a new branch (e.g., add-new-tests).
* Write or improve tests: Add your new tests or improvements to the appropriate test files.
* Commit your changes: Write clear and concise commit messages to describe your changes.
* Submit a pull request: Once you're ready, submit a pull request with a description of your changes.

By contributing, you help make this project better for everyone, and your contributions are greatly appreciated!
