import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String title;

  const SubHeading({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
