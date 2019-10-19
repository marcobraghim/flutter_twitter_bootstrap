import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../color.dart';

class BootstrapBadge extends StatelessWidget {

  final String text;
  final String classes;
  
  BootstrapBadge(this.text, { this.classes });

  @override
  Widget build(BuildContext context) {

    List<String> classes = this.classes.trim().split(" ");

    Color color = BootstrapColor.primary;

    for (String aClass in classes) {
      if (aClass.startsWith('badge')) {
        String colorType = aClass.replaceFirst('badge-', '');
        switch (colorType) {
          case 'warning':
            color = BootstrapColor.warning;
            break;
          case 'danger':
            color = BootstrapColor.danger;
            break;
          case 'success':
            color = BootstrapColor.success;
            break;
          case 'light':
            color = BootstrapColor.light;
            break;
          case 'dark':
            color = BootstrapColor.dark;
            break;
        }
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      child: Text(this.text, style: TextStyle(color: BootstrapColor.light)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(4)
        )
      ),
    );
  }
}
