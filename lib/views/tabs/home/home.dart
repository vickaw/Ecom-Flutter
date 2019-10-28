import 'package:flutter/material.dart';
import 'widgets/categories_section.dart';
import 'widgets/latest_items_section.dart';
import 'widgets/featured_section.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final categoriesSection = CategoriesSection();
    final lastestSection = LatestItemsSection();
    final featuredSection = FeaturedSection();

    final pageElements = Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[categoriesSection, lastestSection, featuredSection],
      ),
    );

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: pageElements,
      ),
    );
  }
}
