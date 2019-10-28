import 'package:flutter/material.dart';
import '../../../global_widgets/header_text.dart';
import 'widgets/cart_list.dart';

class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "Cart");
    final list = CartList();

    final pageElements = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title, list
      ],
    );

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: pageElements,
    );
  }
}
