import 'package:flutter/material.dart';
import '../../../../global_widgets/latest_items_card.dart';
import '../../../../models/latest_item.dart';
import '../../../../global_widgets/header_text.dart';

class LatestItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "Latest");

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: latestItems.length,
        itemBuilder: (BuildContext context, int index) {
          return LatestItemsCard(latestItem: latestItems[index]);
        },
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[title, list],
      ),
    );
  }
}
