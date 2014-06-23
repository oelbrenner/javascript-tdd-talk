function Car() {
  Car.prototype.needsCarWashed = function() {
    return this.age >= 15;
  };

  Car.prototype.age = 0;
}
