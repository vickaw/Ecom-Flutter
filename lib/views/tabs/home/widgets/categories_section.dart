import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../global_widgets/category_icon.dart';
import '../../../../global_widgets/header_text.dart';
import '../../../../models/category.dart';
import '../../../../router.dart';

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "Categories");

    final seeAll = GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(categoriesViewRoute),
      child: Row(
        children: <Widget>[
          Text(
            "SEE ALL",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          Icon(FontAwesomeIcons.angleRight)
        ],
      ),
    );

    final top = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[title, seeAll],
    );

    final categoryList = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 90.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              searchResultsViewRoute,
              arguments: categories[index].name,
            ),
            child: CategoryIcon(category: categories[index]),
          );
        },
      ),
    );

    return Container(
      child: Column(
        children: <Widget>[top, categoryList],
      ),
    );
  }
}
