import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../global_widgets/featured_product_card.dart';
import '../../../../models/product.dart';
import '../../../../global_widgets/header_text.dart';

class FeaturedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(
      width: width,
      height: height,
      allowFontScaling: true,
    )..init(context);

    final title = HeaderText(text: "Featured");

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(160),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return FeaturedProductCard(product: products[index]);
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
