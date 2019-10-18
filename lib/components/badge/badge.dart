import 'package:flutter/widgets.dart';
import '../color.dart';

class BootstrapBadge extends StatelessWidget {

  final Color color;
  final Widget child;
  
  BootstrapBadge({this.child, this.color});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      child: this.child,
      decoration: BoxDecoration(
        color: this.color ?? BootstrapColor.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
    );
  }
}
