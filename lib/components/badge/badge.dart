import 'package:flutter/widgets.dart';
import 'package:flutter_twitter_bootstrap/core/color.dart';
import 'package:flutter_twitter_bootstrap/ftbootstrap.dart';

class Badge extends StatelessWidget {

  final String text;
  final String classes;
  
  Badge(this.text, { this.classes });

  @override
  Widget build(BuildContext context) {

    print(Theme.of(context).fontSize);

    List<String> classes = this.classes.trim().split(" ");

    Color color = Colors.primary;

    for (String aClass in classes) {
      if (aClass.startsWith('badge')) {
        String colorType = aClass.replaceFirst('badge-', '');
        switch (colorType) {
          case 'warning':
            color = Colors.warning;
            break;
          case 'danger':
            color = Colors.danger;
            break;
          case 'success':
            color = Colors.success;
            break;
          case 'light':
            color = Colors.light;
            break;
          case 'dark':
            color = Colors.dark;
            break;
        }
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      child: Text(this.text, style: TextStyle(color: Colors.light)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(4)
        )
      ),
    );
  }
}
