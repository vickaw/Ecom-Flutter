import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../utils/styles.dart';

enum BtnSize { sm, md }

class CustomButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onPressed;
  final bool isInverse;
  final BtnSize size;

  const CustomButton({
    Key key,
    @required this.text,
    this.iconData = FlutterIcons.angle_right_faw5s,
    @required this.onPressed,
    this.isInverse = false,
    this.size = BtnSize.md,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final btnText = Text(
      text.toUpperCase(),
      style: isInverse ? AppTextStyles.btnInverseTextStyle : AppTextStyles.btnTextStyle,
    );

    final btnIcon = Positioned(
      right: size == BtnSize.md ? 10.0 : 5.0,
      top: size == BtnSize.md ? 10.0 : 15.5,
      child: _buildIconCircle(context),
    );

    final btnHeight = size == BtnSize.md ? 55.0 : 30.0;

    return Stack(
      children: <Widget>[
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          height: btnHeight,
          color: isInverse ? Colors.white : Theme.of(context).primaryColor,
          elevation: 4.0,
          onPressed: onPressed,
          child: Center(
            child: btnText,
          ),
        ),
        btnIcon
      ],
    );
  }

  Widget _buildIconCircle(context) {
    final btnSize = size == BtnSize.md ? 35.0 : 17.0;
    return Container(
      height: btnSize,
      width: btnSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isInverse ? Theme.of(context).primaryColor : Colors.white,
      ),
      child: Icon(
        iconData,
        size: size == BtnSize.md ? 20.0 : 10.0,
        color: isInverse ? Colors.white : Theme.of(context).primaryColor,
      ),
    );
  }
}
