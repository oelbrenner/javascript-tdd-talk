function Car() {
  var STARTING_AGE = 0;

  Car.prototype.needsCarWashed = function() {
    return this.age >= 15;
  };

  Car.prototype.age = STARTING_AGE;
}
