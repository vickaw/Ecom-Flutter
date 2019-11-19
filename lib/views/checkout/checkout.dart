import 'package:flutter/material.dart';
import 'package:hello_shop/global_widgets/custom_button.dart';
import 'package:hello_shop/global_widgets/header_text.dart';
import 'package:hello_shop/services/cart.service.dart';
import 'package:hello_shop/utils/utils.dart';
import 'package:hello_shop/views/checkout/widgets/payment_method.dart';
import 'package:hello_shop/views/checkout/widgets/promo_code.dart';
import 'package:hello_shop/views/checkout/widgets/shipping_address.dart';
import '../../router.dart';
import '../../utils/colors.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
    final appBar = AppBar(
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: CustomColors.primaryDarkColor),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );

    final title = HeaderText(text: "Checkout");

    final shippingAddress = ShippingAddress();
    final paymentMethod = PaymentMethod();
    final promoCode = PromoCode();

    final content = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight * 0.75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[title, shippingAddress, paymentMethod, promoCode],
        ),
      ),
    );

    final button = SizedBox(
      height: 55.0,
      child: CustomButton(
        text: "Place Order      ",
        onPressed: () =>
            Navigator.of(context).pushNamed(checkoutSuccessViewRoute),
      ),
    );

    final bottom = Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: screenHeight * 0.15,
      width: double.infinity,
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
            child: button,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[content, bottom],
        ),
      ),
    );
  }
}
