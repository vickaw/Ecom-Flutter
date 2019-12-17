import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/alert.service.dart';
import '../../services/cart.service.dart';
import '../../utils/utils.dart';
import '../../global_widgets/carousel.dart';
import '../../global_widgets/custom_button.dart';
import 'widgets/details.dart';
import 'widgets/product.dart';
import 'widgets/reviews.dart';
import 'package:line_icons/line_icons.dart';
import '../../models/product.dart';
import '../../utils/colors.dart';
import 'widgets/tab_bar_head.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = ["Product", "Details", "Reviews"];
  int selectedColorIndex = 0;
  GlobalKey<CarouselState> carouselStateKey = GlobalKey<CarouselState>();

  CartService cartService = new CartService();
  AlertService alertService = new AlertService();
  String selectedColor;
  String selectedPhoto;
  String selectedSize;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
    selectedColor = widget.product.colors[0].name;
    selectedPhoto = widget.product.photos[0];
    selectedSize = widget.product.sizes[0];
  }

  void changeImageOnColorSelected(int index) {
    carouselStateKey.currentState.switchToPage(index);
    setState(() {
      selectedColorIndex = index;
      selectedPhoto = widget.product.photos[index];
      selectedColor = widget.product.colors[index].name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(
      width: 388,
      height: 1600,
      allowFontScaling: true,
    )..init(context);
    final multiplier = screenHeight / screenWidth;

    final price = Text(
      "\$${widget.product.price}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
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
            widget.product.rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 11.0,
            ),
          ),
        ],
      ),
    );

    final spacer = SizedBox(width: 5.0);

    final priceRating = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[price, spacer, rating],
    );

    final cartItemCounter = Positioned(
      right: 5.0,
      top: 10.0,
      child: Container(
        height: 15.0,
        width: 15.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '0',
            style: TextStyle(fontSize: 10.0),
          ),
        ),
      ),
    );

    final shoppingCartBtn = Container(
      child: Stack(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.shopping_cart,
              color: CustomColors.primaryDarkColor,
              size: 28.0,
            ),
          ),
          cartItemCounter
        ],
      ),
    );

    final appBar = AppBar(
      brightness: Brightness.light,
      leading: IconButton(
        icon: Icon(
          LineIcons.angle_left,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Column(
        children: <Widget>[
          Text(
            widget.product.name,
            style: TextStyle(
              color: CustomColors.primaryDarkColor,
            ),
          ),
          priceRating
        ],
      ),
      actions: <Widget>[shoppingCartBtn],
    );

    final bottom = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setHeight(18) * multiplier,
        ),
        // height: ScreenUtil().setHeight(80.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 55.0,
                child: CustomButton(
                  text: "Share This     ",
                  onPressed: () {},
                  iconData: Icons.share,
                  isInverse: true,
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: SizedBox(
                height: 55.0,
                child: CustomButton(
                  text: "Add to Cart        ",
                  onPressed: () {
                    var cartItem = {
                      'id': AppFunctions.getRandomId(),
                      'name': widget.product.name,
                      'photo': selectedPhoto,
                      'size': selectedSize,
                      'color': selectedColor,
                      'price': widget.product.price
                    };
                    cartService.setCartItem(cartItem);
                    alertService.showAlert(
                      context: context,
                      message: '${widget.product.name} has been added to cart',
                      type: AlertType.success,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final slider = Container(
      height: ScreenUtil().setHeight(320) * multiplier,
      width: double.infinity,
      // color: Colors.cyan,
      child: Carousel(
        key: carouselStateKey,
        images: widget.product.photos.map((photo) {
          return ExactAssetImage(photo);
        }).toList(),
      ),
    );

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: CustomColors.primaryColor,
      labelColor: CustomColors.primaryColor,
      unselectedLabelColor: CustomColors.primaryDarkColor.withOpacity(0.8),
      isScrollable: true,
      tabs: tabs
          .map((tabName) => Tab(child: TabBarHead(tabBarName: tabName)))
          .toList(),
    );

    final tabBarView = Container(
      height: ScreenUtil().setHeight(280) * multiplier,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 10.0),
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          ProductWidget(
            colors: widget.product.colors,
            sizes: widget.product.sizes,
            changeImageOnColorSelected: changeImageOnColorSelected,
          ),
          DetailsWidget(product: widget.product),
          ReviewsWidget()
        ],
      ),
    );

    final pageElements = Container(
      height: screenHeight * 0.9,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[slider, tabBar, tabBarView],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: <Widget>[pageElements, bottom],
      ),
    );
  }
}
