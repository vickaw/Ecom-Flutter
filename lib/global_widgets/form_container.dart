import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;

  const FormContainer({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(12.0);
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: br,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
