import 'package:flutter/material.dart';
import '../../../models/product.dart';
import 'sub_heading.dart';

class DetailsWidget extends StatelessWidget {
  final Product product;

  const DetailsWidget({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firstRow = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          titleAndValue(
            title: "Brand",
            value: product.brand,
            position: CrossAxisAlignment.start,
          ),
          titleAndValue(
            title: "SKU",
            value: product.sku,
            position: CrossAxisAlignment.end,
          ),
        ],
      ),
    );
    final secondRow = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          titleAndValue(
            title: "Condition",
            value: product.condition,
            position: CrossAxisAlignment.start,
          ),
          titleAndValue(
            title: "Material",
            value: product.material,
            position: CrossAxisAlignment.end,
          ),
        ],
      ),
    );
    final thirdRow = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          titleAndValue(
            title: "Category",
            value: product.category,
            position: CrossAxisAlignment.start,
          ),
          titleAndValue(
            title: "Fitting",
            value: product.fitting,
            position: CrossAxisAlignment.end,
          ),
        ],
      ),
    );
    return Container(
      child: Column(
        children: <Widget>[firstRow, secondRow, thirdRow],
      ),
    );
  }

  Widget titleAndValue(
      {String title, String value, CrossAxisAlignment position}) {
    return Column(
      crossAxisAlignment: position,
      children: <Widget>[
        SubHeading(title: title),
        Text(
          value,
          style: TextStyle(),
        )
      ],
    );
  }
}
