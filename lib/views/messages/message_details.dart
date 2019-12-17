import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/message2.dart';
import '../../models/product.dart';
import '../../router.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class MessageDetailsPage extends StatefulWidget {
  final String name;

  const MessageDetailsPage({Key key, this.name}) : super(key: key);

  @override
  _MessageDetailsPageState createState() => _MessageDetailsPageState();
}

class _MessageDetailsPageState extends State<MessageDetailsPage> {
  TextEditingController content = new TextEditingController();
  List<Message2> messages = [];

  @override
  void initState() {
    messages.add(
      Message2(
        content:
            "Dear customer, your order has been shipped. Please see below for tracking number. \n\n\nYour parcel should arrive between 10 - 20 days.",
        isFromMe: false,
      ),
    );
    super.initState();
  }

  void addMessage() {
    setState(() {
      messages.add(Message2(content: content.text, isFromMe: true));
      content.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(
      width: screenWidth,
      height: screenHeight,
      allowFontScaling: true,
    )..init(context);

    final initials = Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushNamed(
          shopProfileViewRoute,
          arguments: widget.name,
        ),
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
              AppFunctions.getNameInitials(widget.name),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    final appBar = AppBar(
      brightness: Brightness.light,
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
            widget.name,
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
        ),
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
      height: ScreenUtil().setHeight(110),
      color: Colors.white,
      child: Column(
        children: <Widget>[hr, productDetails],
      ),
    );

    final chatContainer = SingleChildScrollView(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Tuesday 9:20 AM",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          getMessages(),
          SizedBox(height: 100.0)
        ],
      ),
    );

    final bottom = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenUtil().setHeight(80),
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
            Expanded(
              child: TextField(
                controller: content,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your message",
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
            ),
            MaterialButton(
              color: CustomColors.primaryColor,
              onPressed: () => addMessage(),
              shape: CircleBorder(),
              child: Icon(
                LineIcons.paper_plane,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                product,
                Expanded(
                  child: Container(child: chatContainer),
                )
              ],
            ),
            bottom
          ],
        ),
      ),
    );
  }

  Widget getMessages() {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < messages.length; i++) {
      list.add(chatBubble(message: messages[i]));
    }
    return Column(children: list);
  }

  Widget chatBubble({Message2 message}) {
    return Align(
      alignment: message.isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.all(20.0),
        child: Text(
          message.content,
          style: TextStyle(
            fontSize: 17.0,
            color:  CustomColors.primaryDarkColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: BoxDecoration(
          color: message.isFromMe ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.white,
          borderRadius: message.isFromMe ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ) : BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
