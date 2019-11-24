import 'package:flutter/material.dart';
import 'package:hello_shop/utils/colors.dart';
import '../utils/utils.dart';
import '../models/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;
  final bool isSelected;

  const CategoryIcon(
      {Key key, @required this.category, this.isSelected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = 70.0;

    final circle = AnimatedContainer(
      duration: Duration(milliseconds: 450),
      curve: Curves.easeIn,
      margin: EdgeInsets.only(bottom: 5.0),
      padding: EdgeInsets.all(5.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : CustomColors.scaffoldColor,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppFunctions.formatColor(category.color),
              AppFunctions.formatColor(category.color).withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          heightFactor: 40.0,
          child: Image.asset(category.photo, height: 40.0),
        ),
      ),
    );

    final name = Text(
      category.name,
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );

    final iconCircle = Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[circle, name],
      ),
    );

    return iconCircle;
  }
}
