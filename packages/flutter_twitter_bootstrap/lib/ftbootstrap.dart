library fbootstrap;

/// A Calculator.
class MyCounter {
  int theVal = 0;

  get value => this.theVal;

  /// Returns [value] plus 1.
  int addOne() => this.theVal++;
}
