import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/theme.dart';
import 'package:flutter_twitter_bootstrap/core/theme_data.dart';

import 'package:flutter/material.dart' show MaterialPageRoute;

const TextStyle _errorTextStyle = TextStyle(
  color: Color(0xD0FF0000),
  fontFamily: 'monospace',
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
  decorationColor: Color(0xFFFFFF00),
  decorationStyle: TextDecorationStyle.double,
  debugLabel: 'fallback style; consider putting your text in a Material',
);

class BootstrapApp extends StatefulWidget {

  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final ThemeData themeData;
  final TransitionBuilder builder;

  final GlobalKey<NavigatorState> navigatorKey;
  final List<NavigatorObserver> navigatorObservers;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Locale locale;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;

  const BootstrapApp({
    Key key,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.themeData,
    this.builder,
    this.navigatorKey,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.title = 'Flutter Bootstrap Application',
    this.onGenerateTitle,
    this.locale,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.debugShowMaterialGrid = false
  }): super(key: key);

  @override
  _BootstrapAppState createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<BootstrapApp> {

  @override
  Widget build(BuildContext context) {

    print(Theme.of(context).fontSize);

    Widget result = WidgetsApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return MaterialPageRoute<T>(settings: settings, builder: builder);
      },
      home: widget.home,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onUnknownRoute: widget.onUnknownRoute,
      builder: (BuildContext context, Widget child) {
        AnimatedTheme animTheme = AnimatedTheme(
          data: widget.themeData ?? ThemeData.fallback(),
          isMaterialAppTheme: true,
          child: widget.builder != null
              ? Builder(
                  builder: (BuildContext context) {
                    // Why are we surrounding a builder with a builder?
                    //
                    // The widget.builder may contain code that invokes
                    // Theme.of(), which should return the theme we selected
                    // above in AnimatedTheme. However, if we invoke
                    // widget.builder() directly as the child of AnimatedTheme
                    // then there is no Context separating them, and the
                    // widget.builder() will not find the theme. Therefore, we
                    // surround widget.builder with yet another builder so that
                    // a context separates them and Theme.of() correctly
                    // resolves to the theme we passed to AnimatedTheme.
                    return widget.builder(context, child);
                  },
                )
              : child,
        );
        return animTheme;
      },
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      textStyle: _errorTextStyle,
      color: Color(0xFF000000),
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      // inspectorSelectButtonBuilder: (BuildContext context, VoidCallback onPressed) {
      //   return FloatingActionButton(
      //     child: const Icon(Icons.search),
      //     onPressed: onPressed,
      //     mini: true,
      //   );
      // },
    );

    return result;
  }
}