import 'package:flutter/material.dart';
import '../../../../global_widgets/featured_product_card.dart';
import '../../../../models/product.dart';
import '../../../../global_widgets/header_text.dart';

class FeaturedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.3;
    final title = HeaderText(text: "Featured");

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: height - 60.0,
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
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[title, list],
      ),
    );
  }
}
