import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/ftbootstrap.dart';

class BootstrapScaffold extends StatefulWidget {

  final Widget body;

  BootstrapScaffold({ this.body });

  @override
  State<StatefulWidget> createState() => BootstrapScaffoldState();
}

class BootstrapScaffoldState extends State<BootstrapScaffold> with TickerProviderStateMixin {

  

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Noto Sans',
          color: BootstrapColor.dark,
          fontSize: 16,
        ),
        child: this.widget.body,
      ),
    );
  }
}