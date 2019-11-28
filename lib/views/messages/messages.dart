import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router.dart';
import '../../utils/utils.dart';
import '../../models/message.dart';
import '../../utils/colors.dart';
import '../../global_widgets/header_text.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBar = Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Conversations',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey,
      ),
    );

    final appBar = AppBar(
      brightness: Brightness.light,
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: CustomColors.primaryDarkColor),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    final title = HeaderText(text: "Messages");

    final list = Container(
      margin: EdgeInsets.only(top: 10.0),
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return messageCard(message: messages[index], context: context);
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[title, searchBar, Expanded(child: list,)],
        ),
      ),
    );
  }

  Widget messageCard({Message message, BuildContext context}) {
    final redDot = message.unread == 0
        ? SizedBox()
        : Container(
            height: 22.0,
            width: 22.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                message.unread.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );

    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        messageDetailsViewRoute,
        arguments: message.name,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
      leading: iconBadge(name: message.name),
      title: Text(message.content),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5.0),
          redDot
        ],
      ),
    );
  }

  Widget iconBadge({String name}) {
    double size = 60.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppFunctions.getRandomColor(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          AppFunctions.getNameInitials(name),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
      ),
    );
  }
}
