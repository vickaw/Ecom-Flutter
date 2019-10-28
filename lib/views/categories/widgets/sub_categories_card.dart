import 'package:flutter/material.dart';
import 'package:hello_shop/global_widgets/circle_icon.dart';
import '../../../models/category.dart';
import '../../../router.dart';

class SubCategoriesCard extends StatelessWidget {
  final Category category;

  const SubCategoriesCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final subCategories = category.subCategories;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: subCategories.map((subCategory) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subCategory.name.toUpperCase(),
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            subCategoryGroup(sub: subCategory.sub, context: context),
          ],
        );
      }).toList(),
    );

    return content;
  }

  Widget subCategoryGroup({List<String> sub, BuildContext context}) {
    final br = BorderRadius.circular(12.0);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: br,
          color: Colors.white,
        ),
        child: Column(
          children: sub.map((s) {
            return ListTile(
              leading: Text(s),
              trailing: CircleIcon(),
              onTap: () => Navigator.of(context).pushNamed(
                searchResultsViewRoute,
                arguments: s,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
