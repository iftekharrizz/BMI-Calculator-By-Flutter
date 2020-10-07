import 'package:flutter/material.dart';
import 'dart:async';

import 'constants.dart';

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
      child: FloatingActionButton(
        onPressed: onClick,
        child: Icon(
          buttonIcon,
          color: kInactiveCardColor,
        ),
      ),
    );
  }
}
