function Car() {
  var STARTING_AGE = 0;
  var WASHING_AGE  = 15;

  Car.prototype.needsCarWashed = function() {
    return this.age >= WASHING_AGE;
  };

  Car.prototype.age = STARTING_AGE;
}
