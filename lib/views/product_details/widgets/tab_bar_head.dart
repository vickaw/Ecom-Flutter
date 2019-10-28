import 'package:flutter/material.dart';

class TabBarHead extends StatelessWidget {
  final String tabBarName;

  const TabBarHead({Key key, this.tabBarName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: EdgeInsets.all(8.0),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(18.0)
    //   ),
    //   child: Text(
    //     tabBarName,
    //     style: TextStyle(),
    //   ),
    // );
    return Text(
      tabBarName,
      style: TextStyle(),
    );
  }
}
