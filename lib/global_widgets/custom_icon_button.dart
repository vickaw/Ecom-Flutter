import 'package:flutter/material.dart';
import 'circle_icon.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  const CustomIconButton({
    Key key,
    this.iconData = Icons.keyboard_arrow_right,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40.0),
      onTap: onPressed,
      child: CircleIcon(iconData: iconData),
    );
  }
}
