library flutter_twitter_bootstrap;

export 'components/color.dart';
export 'components/badge/badge.dart';
export 'components/button/button.dart';
export 'components/button/ftcolors.dart';

/// A Calculator.
class MyCounter {
  int theVal = 0;

  get value => this.theVal;

  /// Returns [value] plus 1.
  int addOne() => this.theVal++;
}
