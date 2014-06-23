function Car() {
  var STARTING_AGE = 0;

  Car.prototype.needsCarWashed = function() {
    return false;
  };

  Car.prototype.age = STARTING_AGE;
}
