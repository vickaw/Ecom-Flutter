import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../models/notification.dart';
import '../../global_widgets/header_text.dart';
import '../../utils/colors.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      brightness: Brightness.light,
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: CustomColors.primaryDarkColor),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    final title = HeaderText(text: "Notifications");

    final list = Container(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return notificationCard(notification: notifications[index]);
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[title, Expanded(
            child: list,
          )],
        ),
      ),
    );
  }

  Widget notificationCard({AppNotification notification}) {
    final redDot = Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
      leading: iconBadge(notification.notifyType),
      title: Text(notification.content),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            notification.date,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5.0),
          notification.isRead ? SizedBox() : redDot
        ],
      ),
    );
  }

  Widget iconBadge(NotifyType notifyType) {
    Color color;
    IconData iconData;
    switch (notifyType) {
      case NotifyType.arrival:
        color = Color(0xFF49D1C8);
        iconData = FlutterIcons.map_pin_fea;
        break;
      case NotifyType.deal:
        color = Color(0xFFADD172);
        iconData = FlutterIcons.shopping_bag_fea;
        break;
      case NotifyType.discount:
        color = Color(0xFFFFB051);
        iconData = FlutterIcons.gift_outline_mco;
        break;
      case NotifyType.shipment:
        color = Color(0xFF8A9BFE);
        iconData = FlutterIcons.truck_fea;
        break;
      default:
        color = Color(0xFF8A9BFE);
    }

    double size = 60.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
