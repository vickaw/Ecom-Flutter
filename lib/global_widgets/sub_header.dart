import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onPressed;

  const SubHeader({
    Key key,
    @required this.title,
    @required this.actionText,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: Text(
              actionText.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
