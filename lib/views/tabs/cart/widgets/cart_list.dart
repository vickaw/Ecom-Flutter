import 'package:flutter/material.dart';
import '../../../../global_widgets/loader.dart';
import '../../../../global_widgets/empty_state.dart';
import '../../../../router.dart';
import '../../../../services/cart.service.dart';
import '../../../../utils/utils.dart';
import '../../../../global_widgets/custom_button.dart';
import '../../../../global_widgets/custom_divider.dart';
import '../../../../global_widgets/custom_icon_button.dart';
import '../../../../models/cart_item.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<CartItem> cartItems = [];
  bool get isCartNull {
    if (cartItems == null) {
      return true;
    } else {
      return cartItems.isEmpty ? true : false;
    }
  }

  double totalPrice = 0;

  sumTotalPrice() async {
    double tp = 0;
    tp = await CartService().sum();
    setState(() {
      totalPrice = tp;
    });
  }

  @override
  void initState() {
    sumTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final CartService cartService = new CartService();

    final list = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        height: screenHeight * 0.58,
        child: FutureBuilder(
          future: cartService.getCartItems(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<CartItem>> snapshot,
          ) {
            if (snapshot.hasData) {
              cartItems = snapshot.data;
              if (cartItems.isNotEmpty) {
                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return productCard(
                      length: cartItems.length,
                      product: cartItems[index],
                      context: context,
                      index: index,
                    );
                  },
                );
              } else {
                return EmptyState(
                  message: "You currently have no items in your cart!",
                );
              }
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );

    final divider = CutsomDivider(
      margin: EdgeInsets.symmetric(vertical: 10.0),
    );

    final checkoutBtn = SizedBox(
      height: 55.0,
      child: CustomButton(
        text: "Checkout       ",
        onPressed: () => Navigator.of(context).pushNamed(checkoutViewRoute),
      ),
    );

    final totals = totalPrice == 0
        ? Container()
        : Container(
            height: screenHeight * 0.1,
            padding: EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "TOTAL",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontFamily: AppFonts.secondaryFont,
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        "Free Domestic Shipping",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: checkoutBtn,
                ),
              ],
            ),
          );

    return Container(
      child: Column(
        children: <Widget>[list, divider, totals],
      ),
    );
  }

  Widget productCard({
    int length,
    CartItem product,
    BuildContext context,
    int index,
  }) {
    final size = MediaQuery.of(context).size.height * 0.16;
    final circularImage = Container(
      padding: EdgeInsets.all(10.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        heightFactor: 29.0,
        child: Image.asset(
          product.photo,
          fit: BoxFit.cover,
          height: 50.0,
        ),
      ),
    );

    final itemCountSpacer = SizedBox(width: 10.0);

    final itemCounter = Container(
      child: Row(
        children: <Widget>[
          CustomIconButton(
            iconData: Icons.remove,
            onPressed: () async {
              await CartService().reduce(product.id);
              setState(() {
                sumTotalPrice();
              });
            },
          ),
          itemCountSpacer,
          Text(
            product.number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          itemCountSpacer,
          CustomIconButton(
            iconData: Icons.add,
            onPressed: () async {
              await CartService().add(product.id);
              setState(() {
                sumTotalPrice();
              });
            },
          ),
        ],
      ),
    );

    final itemSpacer = SizedBox(
      height: 10.0,
    );

    final itemDetails = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Text(
            "${product.size}, ${product.color}",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          itemSpacer,
          Text(
            "\$${product.price.toString()}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          itemSpacer,
          itemCounter,
        ],
      ),
    );

    final bg = Container(
      alignment: AlignmentDirectional.centerStart,
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );

    final bgSec = Container(
      alignment: AlignmentDirectional.centerEnd,
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Dismissible(
            secondaryBackground: bgSec,
            background: bg,
            key: Key(product.id.toString()),
            onDismissed: (direction) async {
              await CartService().removeItemFromCart(product.id);
              setState(() {
                sumTotalPrice();
                cartItems.removeAt(index);
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: <Widget>[
                  circularImage,
                  SizedBox(
                    width: 20.0,
                  ),
                  itemDetails
                ],
              ),
            ),
          ),
          Divider(indent: MediaQuery.of(context).size.width * 0.35)
        ],
      ),
    );
  }
}
