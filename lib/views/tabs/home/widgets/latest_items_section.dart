import 'package:flutter/material.dart';
import '../../../../global_widgets/latest_items_card.dart';
import '../../../../models/latest_item.dart';
import '../../../../global_widgets/header_text.dart';

class LatestItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height =  MediaQuery.of(context).size.height * 0.33;
    final title = HeaderText(text: "Latest");

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: height - 60.0,
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
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[title, list],
      ),
    );
  }
}
