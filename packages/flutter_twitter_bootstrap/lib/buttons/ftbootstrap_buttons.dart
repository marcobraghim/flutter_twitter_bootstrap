library fbootstrap;

import 'package:flutter/material.dart';

import 'ftcolors.dart';

class FTBootStrapButton extends StatefulWidget {
  VoidCallback onPressed;
  Text text;
  Color color;

  FTBootStrapButton({this.onPressed, this.text, this.color});

  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<FTBootStrapButton> {
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
