import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../models/product.dart';
import '../router.dart';

class SearchProductCard extends StatelessWidget {
  final Product product;

  const SearchProductCard({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final br = BorderRadius.circular(12.0);
    final image = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Image.asset(
          product.photos[0],
          fit: BoxFit.contain,
          height: screenHeight * 0.1,
        ),
      ),
    );

    final name = Text(
      product.name,
      style: TextStyle(
        fontSize: 16.0,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    final price = Text(
      "\$${product.price}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

    final rating = Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: CustomColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.white,
            size: 13.5,
          ),
          Text(
            product.rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 11.0,
            ),
          ),
        ],
      ),
    );

    final priceRating = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[price, rating],
    );

    return Material(
      borderRadius: br,
      color: Colors.white,
      child: InkWell(
        borderRadius: br,
        onTap: () => Navigator.of(context).pushNamed(
          productDetailsViewRoute,
          arguments: product,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    name,
                    priceRating,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
