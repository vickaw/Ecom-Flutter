import 'package:flutter/material.dart';

class CutsomDivider extends StatelessWidget {
  final EdgeInsets margin;
  final double width;
  final double height;
  final Color color;

  const CutsomDivider({
    Key key,
    this.margin = const EdgeInsets.symmetric(vertical: 15.0),
    this.width = double.infinity,
    this.height = 1.0,
    this.color = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      color: color.withOpacity(0.3),
    );
  }
}
