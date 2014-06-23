test('new cars do not need a car wash', function() {
  var car = new Car();
  equal(car.needsCarWashed(), false, 'it does not need a car wash')
});
