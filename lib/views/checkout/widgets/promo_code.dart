import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../global_widgets/custom_icon_button.dart';
import '../../../utils/colors.dart';

class PromoCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            FlutterIcons.tag_sli,
            color: CustomColors.primaryDarkColor,
            size: 22.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              "Add promo code",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19.0,
                color: CustomColors.primaryColor,
              ),
            ),
          ),
          CustomIconButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
