import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'circle_icon.dart';

class IconListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String value;
  final bool isSmall;

  const IconListTile({
    Key key,
    @required this.iconData,
    @required this.title,
    this.value,
    this.isSmall = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: CustomColors.primaryDarkColor,
        size: isSmall ? 26.0 : 24.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: CustomColors.primaryDarkColor,
        ),
      ),
      trailing: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              value ?? "",
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            SizedBox(width: 10.0),
            CircleIcon(),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
