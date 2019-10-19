import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/theme_data.dart';

class BootstrapApp extends StatefulWidget {

  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final ThemeData themeData;

  const BootstrapApp({
    Key key,
    this.home,
    this.routes,
    this.initialRoute,
    this.themeData
  }): super(key: key);

  @override
  _BootstrapAppState createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<BootstrapApp> {
  @override
  Widget build(BuildContext context) {
    return widget.home;
  }
}