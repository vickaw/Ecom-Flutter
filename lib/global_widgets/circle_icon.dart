import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData iconData;

  const CircleIcon({
    Key key,
    this.iconData = Icons.keyboard_arrow_right,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 20.0,
      ),
    );
  }
}
