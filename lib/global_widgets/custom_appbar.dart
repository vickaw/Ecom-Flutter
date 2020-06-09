import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../utils/colors.dart';
import '../router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      leading: Container(),
      actions: <Widget>[
        iconBtn(
          iconData: FlutterIcons.comment_discussion_oct,
          count: 5,
          route: messagesViewRoute,
          context: context,
        ),
        iconBtn(
          iconData: FlutterIcons.bell_outline_mco,
          count: 10,
          route: notificationsViewRoute,
          context: context,
        ),
      ],
    );
  }

  Widget iconBtn({
    @required IconData iconData,
    @required int count,
    @required String route,
    @required BuildContext context,
  }) {
    final icon = Container(
      padding: EdgeInsets.only(left: 8.0),
      child: Icon(
        iconData,
        color: CustomColors.primaryDarkColor,
      ),
    );

    final counterSize = 18.0;

    final counter = Positioned(
      left: 0,
      bottom: 8,
      child: Container(
        height: counterSize,
        width: counterSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.primaryColor,
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        margin: EdgeInsets.only(right: 20.0, top: 20.0),
        child: Stack(
          children: <Widget>[icon, counter],
        ),
      ),
    );
  }
}
