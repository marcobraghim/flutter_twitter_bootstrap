import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/theme_data.dart';
import 'package:flutter_twitter_bootstrap/core/color.dart';

const Duration kThemeAnimationDuration = Duration(milliseconds: 200);

class Theme extends StatelessWidget {

  final ThemeData data;

  final bool isMaterialAppTheme;

  final Widget child;

  static final ThemeData _kFallbackTheme = ThemeData.fallback();
  
  const Theme({ Key key, @required this.data, this.isMaterialAppTheme = false, @required this.child, }):
    assert(child != null),
    assert(data != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: child,
      // child: CupertinoTheme(
      //   // We're using a MaterialBasedCupertinoThemeData here instead of a
      //   // CupertinoThemeData because it defers some properties to the Material
      //   // ThemeData.
      //   data: MaterialBasedCupertinoThemeData(
      //     materialTheme: data,
      //   ),
      //   child: IconTheme(
      //     data: data.iconTheme,
      //     child: child,
      //   ),
      // ),
    );
  }

  static ThemeData of(BuildContext context) {

    final _InheritedTheme inheritedTheme = context.inheritFromWidgetOfExactType(_InheritedTheme);
    final ThemeData theme = inheritedTheme?.theme?.data ?? _kFallbackTheme;

    return ThemeData.localize(theme);
  }
}

class _InheritedTheme extends InheritedTheme {

  final Theme theme;

  const _InheritedTheme({ Key key, @required this.theme, @required Widget child}):
    assert(theme != null),
    super(key: key, child: child);

  @override
  Widget wrap(BuildContext context, Widget child) {
    final _InheritedTheme ancestorTheme = context.ancestorWidgetOfExactType(_InheritedTheme);
    return identical(this, ancestorTheme) ? child : Theme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}

class ThemeDataTween extends Tween<ThemeData> {
  ThemeDataTween({ ThemeData begin, ThemeData end }) : super(begin: begin, end: end);

  @override
  ThemeData lerp(double t) => ThemeData.lerp(begin, end, t);
}

class AnimatedTheme extends ImplicitlyAnimatedWidget {

  final ThemeData data;
  final bool isMaterialAppTheme;
  final Widget child;

  const AnimatedTheme({
    Key key,
    @required this.data,
    this.isMaterialAppTheme = false,
    Curve curve = Curves.linear,
    Duration duration = kThemeAnimationDuration,
    VoidCallback onEnd,
    @required this.child,
  }) : assert(child != null),
       assert(data != null),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  @override
  _AnimatedThemeState createState() => _AnimatedThemeState();
}

class _AnimatedThemeState extends AnimatedWidgetBaseState<AnimatedTheme> {
  ThemeDataTween _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(_data, widget.data, (dynamic value) => ThemeDataTween(begin: value));
    assert(_data != null);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: widget.isMaterialAppTheme,
      child: widget.child,
      data: _data.evaluate(animation),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<ThemeDataTween>('data', _data, showName: false, defaultValue: null));
  }
}
