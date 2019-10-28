import 'package:flutter/material.dart';
import '../models/product.dart';
import '../router.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;

  const FeaturedProductCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(12.0);

    final image = Image.asset(product.photos[0], height: 90.0,);
    final name = Text(
      product.name,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      
    );
    final price = Text(
      "\$${product.price}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
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
          width: MediaQuery.of(context).size.width * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[image, name, price],
          ),
        ),
      ),
    );
  }
}
