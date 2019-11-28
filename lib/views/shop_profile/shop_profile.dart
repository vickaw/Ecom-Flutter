import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../views/shop_profile/widgets/reviews_widget.dart';
import '../../views/shop_profile/widgets/home_widget.dart';
import '../../views/shop_profile/widgets/products_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:themify_flutter/themify_flutter.dart';

class ShopProfilePage extends StatefulWidget {
  final String shopName;

  const ShopProfilePage({Key key, this.shopName}) : super(key: key);

  @override
  _ShopProfilePageState createState() => _ShopProfilePageState();
}

class _ShopProfilePageState extends State<ShopProfilePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = ["Home", "Products", "Reviews"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final appBar = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                LineIcons.angle_left,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Themify.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );

    final title = Positioned(
      top: screenHeight * 0.105,
      left: 0,
      right: 0,
      child: Column(
        children: <Widget>[
          Text(
            "ELEGANCE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
            ),
          ),
          Text(
            "All your fashion needs under one roof",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );

    final image = Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.shopBanner),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.red.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
    );

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: CustomColors.primaryColor,
      labelColor: CustomColors.headerColor,
      unselectedLabelColor: CustomColors.headerColor.withOpacity(0.3),
      labelStyle: TextStyle(fontSize: 17.0),
      tabs: tabs.map((tabName) => Tab(child: Text(tabName))).toList(),
    );

    final tabsHolder = Container(
      height: 60.0,
      width: double.infinity,
      color: Colors.white,
      child: tabBar,
    );

    final tabBarView = Container(
      height: screenHeight * 0.65,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TabBarView(
        controller: tabController,
        children: <Widget>[HomeWidget(), ProductsWidget(), ReviewsWidget()],
      ),
    );

    final pageElements = Container(
      child: Column(
        children: <Widget>[image, tabsHolder, tabBarView],
      ),
    );

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[pageElements, appBar, title],
        ),
      ),
    );
  }
}
