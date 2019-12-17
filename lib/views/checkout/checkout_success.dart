import 'package:flutter/material.dart';
import '../../global_widgets/custom_button.dart';
import '../../router.dart';
import '../../utils/colors.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      brightness: Brightness.light,
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: CustomColors.primaryDarkColor),
          onPressed: () => Navigator.of(context).pushReplacementNamed(homeViewRoute),
        )
      ],
    );
    final check = Container(
      margin: EdgeInsets.only(bottom: 30.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        Icons.check,
        size: 50.0,
        color: CustomColors.primaryColor,
      ),
    );

    final title = Text(
      "Order Placed!",
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w500,
        color: CustomColors.primaryDarkColor,
      ),
    );

    final description = Text(
      "Your order has been placed successfully. \n For more details check All My Order Page under Profile Tab",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17.0,
        color: CustomColors.primaryDarkColor,
      ),
    );

    final spacer = SizedBox(
      height: 20.0,
    );

    final button = SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: CustomButton(text: "My Orders", onPressed: () {}),
    );

    final content = Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            check,
            title,
            spacer,
            description,
            spacer,
            spacer,
            spacer,
            button,
            spacer,
            spacer
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: content,
    );
  }
}
