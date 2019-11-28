import 'package:flutter/material.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/search_product_card.dart';
import '../../../global_widgets/trending_items_card.dart';
import '../../../models/product.dart';
import '../../../models/trending.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.33;
    final title = HeaderText(text: "Trending");
    final List<Product> filteredList = List.from(products);

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: height - 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingItems.length,
        itemBuilder: (BuildContext context, int index) {
          return TrendingItemsCard(trendingItem: trendingItems[index]);
        },
      ),
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 20.0),
              title,
              list,
              SizedBox(height: 20.0),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.8,
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
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ],
    );
  }
}
