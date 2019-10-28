import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
            LineIcons.tag,
            color: CustomColors.primaryDarkColor,
            size: 26.0,
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
