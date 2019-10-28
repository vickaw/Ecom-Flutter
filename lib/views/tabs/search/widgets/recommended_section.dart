import 'package:flutter/material.dart';

import '../../../../router.dart';
import '../../../../global_widgets/sub_header.dart';

class RecommendedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> recommendedItems = [
      "Jeans",
      "Mini Skirt",
      "Jacket",
      "Accessories",
      "Yoga Pants",
      "Eye Shadow",
      "Sports Accessories"
    ];
    return Container(
      child: Column(
        children: <Widget>[
          SubHeader(
            title: "Recommended",
            actionText: "Refresh",
            onPressed: () {},
          ),
          Wrap(
            spacing: 5.0,
            children: recommendedItems.map((item) {
              return recommendedCard(context: context, item: item);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget recommendedCard({BuildContext context, String item}) {
    return GestureDetector(
      onTap: () => viewResults(context, item),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0, right: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  viewResults(BuildContext context, String value) {
    Navigator.of(context).pushNamed(searchResultsViewRoute, arguments: value);
  }
}
