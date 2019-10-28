import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../router.dart';
import 'widgets/recently_viewed_section.dart';
import 'widgets/recommended_section.dart';
import '../../../global_widgets/header_text.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "Search");

    final searchBar = Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Something',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.grey),
        cursorColor: Colors.grey,
        onSubmitted: (value){
          viewResults(context, value);
        },
      ),
    );

    final recentlyViewsSection = RecentlyViewedSection();

    final recomendedSection = RecommendedSection();

    final pageElements = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        searchBar,
        recentlyViewsSection,
        recomendedSection
      ],
    );

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: pageElements,
      ),
    );
  }

  viewResults(BuildContext context, String value){
    Navigator.of(context).pushNamed(searchResultsViewRoute, arguments: value);
  }
}
