import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../global_widgets/latest_items_card.dart';
import '../../../../models/latest_item.dart';
import '../../../../global_widgets/header_text.dart';

class LatestItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(
      width: width,
      height: height,
      allowFontScaling: true,
    )..init(context);

    final title = HeaderText(text: "Latest");

    

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(200),
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
      height: ScreenUtil().setHeight(260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[title, list],
      ),
    );
  }
}
