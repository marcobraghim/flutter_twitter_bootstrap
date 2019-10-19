import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/color.dart';
import 'package:flutter_twitter_bootstrap/ftbootstrap.dart';

@immutable
class ThemeData extends Diagnosticable
{
  final int fontSize;
  final String fontFamily;
  final Color color;
  final Color backgroundColor;

  factory ThemeData({
    int fontSize,
    String fontFamily,
    Color color,
    Color backgroundColor
  }) {
    
    fontSize ??= 16;
    fontFamily ??= 'Noto Sans';
    color ??= Colors.dark;
    backgroundColor ??= Colors.white;

    return ThemeData.raw(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      backgroundColor: backgroundColor
    );
  }

  const ThemeData.raw({
    @required this.fontSize,
    @required this.fontFamily,
    @required this.color,
    @required this.backgroundColor
  }):
    assert(fontSize != null),
    assert(fontFamily != null),
    assert(color != null),
    assert(backgroundColor != null);

  factory ThemeData.fallback() => ThemeData();

  static ThemeData lerp(ThemeData a, ThemeData b, double t) {
    assert(a != null);
    assert(b != null);
    assert(t != null);
    // Warning: make sure these properties are in the exact same order as in
    // hashValues() and in the raw constructor and in the order of fields in
    // the class and in the lerp() method.
    return ThemeData.raw(
      fontSize: a.fontSize+((a.fontSize - b.fontSize)/2).round(),
      fontFamily: a.fontFamily,
      color: Color.lerp(a.color, b.color, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)
    );
  }

  ThemeData copyWith({
    int fontSize,
    String fontFamily,
    Color color,
    Color backgroundColor
  }) {
    return ThemeData.raw(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor
    );
  }

  static ThemeData localize(ThemeData baseTheme) {
    assert(baseTheme != null);

    // Talvez no futuro tenhamos alguma coisa para
    // por aqui...
    return baseTheme;
  }
}
