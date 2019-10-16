import 'package:flutter/material.dart';

class BootstrapButton extends StatefulWidget {
  VoidCallback onPressed;
  Text text;
  Color color;

  BootstrapButton({this.onPressed, this.text, this.color});

  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<BootstrapButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        child: widget.text,
        onPressed: widget.onPressed,
        color: widget.color,
        height: 43,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
