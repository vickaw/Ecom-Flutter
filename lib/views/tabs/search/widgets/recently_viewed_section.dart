import 'package:flutter/material.dart';
import '../../../../global_widgets/sub_header.dart';
import '../../../../models/product.dart';
import '../../../../router.dart';

class RecentlyViewedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SubHeader(
            title: "Recently Viewed",
            actionText: "Clear",
            onPressed: () {},
          ),
          listView()
        ],
      ),
    );
  }

  Widget listView() {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return productCard(product: products[index], context: context);
        },
      ),
    );
  }

  Widget productCard({Product product, BuildContext context}) {
    final br = BorderRadius.circular(12.0);

    final image = Image.asset(product.photos[0]);
    final name = Text(
      product.name,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    final price = Text(
      "\$${product.price}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0, left: 3.0),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushNamed(productDetailsViewRoute, arguments: product),
        shape: RoundedRectangleBorder(borderRadius: br),
        elevation: 0.0,
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.37,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: image,
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[name, price],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
