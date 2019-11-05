import 'dart:ui';

import 'package:flutter/material.dart';
import '../global_widgets/custom_button.dart';
import '../models/latest_item.dart';

class LatestItemsCard extends StatelessWidget {
  final LatestItem latestItem;

  const LatestItemsCard({Key key, this.latestItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              latestItem.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            width: 150.0,
            child: CustomButton(
              text: "SEE MORE",
              isInverse: true,
              size: BtnSize.sm,
              onPressed: () {},
            ),
          )
        ],
      ),
    );

    final contentBox = Container(
      child: content,
    );

    final br = BorderRadius.circular(20.0);

    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: br),
        elevation: 4.0,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: br,
            image: DecorationImage(
              image: AssetImage(
                latestItem.photo,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: contentBox,
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
