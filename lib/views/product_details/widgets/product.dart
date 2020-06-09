import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../../../models/product.dart';
import 'sub_heading.dart';

class ProductWidget extends StatefulWidget {
  final List<ProductColor> colors;
  final List<String> sizes;
  final Function(int) changeImageOnColorSelected;

  const ProductWidget({
    Key key,
    @required this.colors,
    @required this.sizes,
    @required this.changeImageOnColorSelected,
  }) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  void onColorSelected(index) {
    widget.changeImageOnColorSelected(index);
    setState(() {
      selectedColorIndex = index;
    });
  }

  void onSizeSelected(index) {
    setState(() {
      selectedSizeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorList = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.colors.map((color) {
          int currentIndex = widget.colors.indexOf(color);
          bool isSelected = currentIndex == selectedColorIndex;
          return colorBall(
            color: color.color,
            isSelected: isSelected,
            onSelected: () => onColorSelected(currentIndex),
          );
        }).toList(),
      ),
    );

    final colorSelectionSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubHeading(title: "SELECT COLOR"),
          colorList,
        ],
      ),
    );

    final sizesList = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.sizes.map((size) {
          int currentIndex = widget.sizes.indexOf(size);
          bool isSelected = currentIndex == selectedSizeIndex;
          return sizeBox(
            size: size,
            isSelected: isSelected,
            onSelected: () => onSizeSelected(currentIndex),
          );
        }).toList(),
      ),
    );

    final sizesSelectionSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubHeading(title: "SELECT SIZE (US)"),
          sizesList,
        ],
      ),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          colorSelectionSection,
          SizedBox(height: 25.0,),
          Expanded(
            child: sizesSelectionSection,
          )
        ],
      ),
    );
  }

  Widget colorBall({String color, bool isSelected, Function onSelected}) {
    final checked = isSelected
        ? Icon(
            Icons.check,
            color: Colors.white,
          )
        : Container();
    return MaterialButton(
      elevation: isSelected ? 4.0 : 0.0,
      minWidth: 40.0,
      color: AppFunctions.formatColor(color),
      splashColor: AppFunctions.formatColor(color),
      shape: CircleBorder(),
      onPressed: onSelected,
      child: checked,
    );
  }

  Widget sizeBox({String size, bool isSelected, Function onSelected}) {
    final br = BorderRadius.circular(12.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 8.0, left: 2.0),
      child: MaterialButton(
        elevation: isSelected ? 4.0 : 0.0,
        minWidth: 80.0,
        color: isSelected ? CustomColors.primaryColor : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: br),
        onPressed: onSelected,
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 15.0,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
