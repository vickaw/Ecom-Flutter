import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_card.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/icon_list_tile.dart';
import 'package:themify_flutter/themify_flutter.dart';

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
            iconData: Themify.location_pin,
            title: "Shipping Address",
          ),
          IconListTile(
            iconData: Themify.credit_card,
            title: "Payment Method",
          ),
          IconListTile(
            iconData: LineIcons.money,
            title: "Currency",
            isSmall: true,
          ),
          IconListTile(
            iconData: LineIcons.language,
            title: "Language",
            isSmall: true,
          ),
        ],
      ),
    );

    final secondOptions = CustomCard(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          IconListTile(
            iconData: Themify.bell,
            title: "Notification Settings",
          ),
          IconListTile(
            iconData: LineIcons.shield,
            title: "Privacy Policy",
            isSmall: true,
          ),
          IconListTile(
            iconData: Themify.comments,
            title: "Frequenly Asked Questions",
          ),
          IconListTile(
            iconData: LineIcons.legal,
            title: "Legal Information",
            isSmall: true,
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
