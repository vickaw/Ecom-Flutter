import 'package:flutter/material.dart';
import 'package:hello_shop/models/product.dart';
import '../../router.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class MessageDetailsPage extends StatelessWidget {
  final String name;

  const MessageDetailsPage({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final initials = Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushNamed(shopProfileViewRoute, arguments: name),
        shape: CircleBorder(),
        child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: AppFunctions.getRandomColor(),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              AppFunctions.getNameInitials(name),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    final appBar = AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          LineIcons.angle_left,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.0),
          Text(
            name,
            style: TextStyle(
              color: CustomColors.primaryDarkColor,
              fontSize: 18.0,
            ),
          ),
          Text(
            "Active",
            style: TextStyle(
              color: CustomColors.primaryDarkColor,
              fontSize: 14.0,
            ),
          )
        ],
      ),
      actions: <Widget>[initials],
    );

    final hr = Divider();

    final productImage = Material(
      shadowColor: Colors.white70,
      shape: CircleBorder(),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          heightFactor: 35.0,
          child: Image.asset(products[0].photos[0], fit: BoxFit.cover),
        )
      ),
    );

    final orderDetails = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Order #3038843",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
          Text(
            products[0].name,
            style: TextStyle(fontSize: 17.0),
          ),
          Text(
            "\$${products[0].price.toString()}",
            style: TextStyle(fontSize: 17.0),
          )
        ],
      ),
    );

    final productDetails = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          productImage,
          SizedBox(
            width: 10.0,
          ),
          orderDetails
        ],
      ),
    );

    final product = Container(
      height: screenHeight * 0.16,
      color: Colors.white,
      child: Column(
        children: <Widget>[hr, productDetails],
      ),
    );

    final chatBubble = Container(
      margin: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Dear customer, your order has been shipped. Please see below for tracking number. \n\n\n Your parcel should arrive between 10 - 20 days.",
        style: TextStyle(
          fontSize: 17.0,
          color: CustomColors.primaryDarkColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
    );

    final chatContainer = Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(left: 20.0),
      height: screenHeight * 0.63,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "Tuesday 9:20 AM",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          chatBubble
        ],
      ),
    );

    final bottom = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight * 0.078,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          MaterialButton(
            color: Color(0xFFE4E3E8),
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: CustomColors.primaryDarkColor,
            ),
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your message",
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
          MaterialButton(
            color: CustomColors.primaryColor,
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[product, chatContainer, bottom],
        ),
      ),
    );
  }
}
