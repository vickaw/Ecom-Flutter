import 'package:flutter/material.dart';
import 'package:hello_shop/utils/styles.dart';

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.headerTextTextStyle,
    );
  }
}
