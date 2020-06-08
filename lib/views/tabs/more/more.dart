import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../global_widgets/custom_card.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/icon_list_tile.dart';

import '../../../router.dart';

class MoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "More");

    final firstOptions = CustomCard(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          IconListTile(
            iconData: FlutterIcons.map_pin_fea,
            title: "Shipping Address",
          ),
          IconListTile(
            iconData: FlutterIcons.credit_card_plus_outline_mco,
            title: "Payment Method",
          ),
          IconListTile(
            iconData: FlutterIcons.attach_money_mdi,
            title: "Currency",
            isSmall: true,
          ),
          IconListTile(
            iconData: FlutterIcons.language_mdi,
            title: "Language",
          ),
        ],
      ),
    );

    final secondOptions = CustomCard(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          IconListTile(
            iconData: FlutterIcons.bell_outline_mco,
            title: "Notification Settings",
          ),
          IconListTile(
            iconData: FlutterIcons.shield_outline_mco,
            title: "Privacy Policy",
          ),
          IconListTile(
            iconData: FlutterIcons.comment_discussion_oct,
            title: "Frequenly Asked Questions",
          ),
          IconListTile(
            iconData: FlutterIcons.launch_mco,
            title: "Legal Information",
          ),
        ],
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final logout = Center(
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(authViewRoute),
        child: Text(
          "LOG OUT",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );

    final pageElements = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        spacer,
        spacer,
        firstOptions,
        spacer,
        secondOptions,
        spacer,
        logout
      ],
    );

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: pageElements,
      ),
    );
  }
}
