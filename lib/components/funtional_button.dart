import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bmi_calculator_flutter/components/constants.dart';

class FunctionalButton extends StatelessWidget {
  final Timer timer;
  final Function onClick;
  final IconData buttonIcon;
  final Function onClickDown;
  final Function onClickUp;
  final Function onClickCancel;

  FunctionalButton(
      {@required this.onClick,
      this.buttonIcon,
      this.onClickDown,
      this.timer,
      this.onClickUp,
      this.onClickCancel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onClickDown,
      onTapUp: onClickUp,
      onTapCancel: onClickCancel,
      child: RawMaterialButton(
        elevation: 15,
        onPressed: onClick,
        constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
        fillColor: Colors.orange,
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.black
          )
        ),
        child: Icon(
          buttonIcon,
          color: kInactiveCardColor,
        ),
      ),
    );
  }
}
