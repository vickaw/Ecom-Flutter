import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double elevation;

  const CustomCard({Key key, @required this.child, this.elevation = 0.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(12.0);
    return Material(
      elevation: elevation,
      shadowColor: Colors.white,
      borderRadius: br,
      child: Container(
        child: child,
      ),
    );
  }
}
