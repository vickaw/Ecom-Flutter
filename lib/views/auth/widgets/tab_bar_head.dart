import 'package:flutter/material.dart';
import '../../../utils/styles.dart';

class TabBarHead extends StatelessWidget {
  final String tabBarName;

  const TabBarHead({Key key, this.tabBarName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      tabBarName,
      style: AppTextStyles.tabBarTextStyle,
    );
  }
}
