test('new cars do not need a car wash', function() {
  var car = new Car();
  equal(car.needsCarWashed(), false, 'it does not need a car wash');
});

test('new cars have a default age', function() {
  var car = new Car();
  equal(car.age, 0, 'the car is 0 days old by default');
});
