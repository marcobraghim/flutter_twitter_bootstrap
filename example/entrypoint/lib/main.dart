import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/ftbootstrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BootstrapApp(
      themeData: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: true, // Este cara deve ser removido
      home: BootstrapScaffold(
        body: Container(
          child: Column(children: <Widget>[
            Text('You have pushed the button this many times:'),
            Badge('Sei la... kkkk', classes: "badge-dark text-light"),
            BootstrapButton(
              onPressed: () {
                print('Ui');
              },
              text: Text('Me aperte'),
              color: Colors.primary
            )
          ])
        ),
      ),
    );
  }
}
