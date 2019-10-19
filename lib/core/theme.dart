import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/theme_data.dart';
import 'package:flutter_twitter_bootstrap/core/color.dart';

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
      child: Container(
        height: 80,
        width: 500,
        color: Colors.danger,
        child: Center(child: Text('Não sei o que por aqui')),
      ),
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

    print(inheritedTheme?.theme?.data);

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