import 'package:flutter/material.dart';
import '../../../global_widgets/search_product_card.dart';
import '../../../models/product.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> filteredList = List.from(products); 
    
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (
                BuildContext context,
                int index,
              ) {
                return SearchProductCard(product: filteredList[index]);
              },
              childCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }
}