import 'package:flutter/material.dart';
import '../../views/categories/widgets/sub_categories_card.dart';
import '../../global_widgets/category_icon.dart';
import '../../global_widgets/header_text.dart';
import '../../models/category.dart';
import '../../utils/colors.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: CustomColors.primaryDarkColor),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    final title = HeaderText(text: "All Categories");

    final leftSection = Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: Column(
            children: categories.map((category) {
              bool isSelected = selectedCategoryIndex == categories.indexOf(category) ? true : false;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                       selectedCategoryIndex = categories.indexOf(category); 
                      });
                    },
                    child: CategoryIcon(category: category, isSelected: isSelected,),
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );

    final rightSection = Expanded(
      flex: 2,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: SubCategoriesCard(category: categories[selectedCategoryIndex]),
        ),
      ),
    );

    final content = Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[leftSection, rightSection],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(child: title),
           Expanded(
             child:  Container(child: content),
           )
          ],
        ),
      ),
    );
  }
}
