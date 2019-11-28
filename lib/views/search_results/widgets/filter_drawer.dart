import 'package:flutter/material.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_icon_button.dart';
import '../../../global_widgets/sub_header.dart';

class FilterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subHeader = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: SubHeader(
        title: "Refine Results",
        actionText: "Clear",
        onPressed: () {},
      ),
    );

    final button = Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
       padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: 
      CustomButton(text: "Apply Filters", onPressed: (){},),
    );

    return Drawer(
      child: ListView(
        children: <Widget>[
          subHeader,
          drawerItem(name: "View", value: "Thumbnails"),
          drawerItem(name: "Category", value: "Shirt"),
          drawerItem(name: "Condition", value: "Brand New"),
          drawerItem(name: "Material", value: "Cotton"),
          drawerItem(name: "Color", value: "Red"),
          drawerItem(name: "Brand", value: "All Brands"),
          drawerItem(name: "Size", value: "Thumbnails"),
          drawerItem(name: "Price Range", value: "\$0 - \$30"),
          button,
        ],
      ),
    );
  }

  Widget drawerItem({String name, String value}) {
    return ListTile(
      leading: Text(name),
      trailing: Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            SizedBox(width: 10.0),
            CustomIconButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
