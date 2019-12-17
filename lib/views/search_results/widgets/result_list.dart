import 'package:flutter/material.dart';
import '../../../global_widgets/search_product_card.dart';
import '../../../models/product.dart';

class SearchResultList extends StatelessWidget {
  final String filter;

  const SearchResultList({Key key, this.filter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Product> filteredList = _filteredList(List.from(products));

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SearchProductCard(product: filteredList[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.8,
        ),
        itemCount: filteredList.length,
      ),
    );
  }

  List<Product> _filteredList(List<Product> duplicate) {
    return duplicate;
  }
}
