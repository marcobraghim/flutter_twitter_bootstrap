library fbootstrap;
export 'buttons/ftbootstrap_buttons.dart';
export 'buttons/ftcolors.dart';
/// A Calculator.
class MyCounter {
  int theVal = 0;

  get value => this.theVal;

  /// Returns [value] plus 1.
  int addOne() => this.theVal++;
}
