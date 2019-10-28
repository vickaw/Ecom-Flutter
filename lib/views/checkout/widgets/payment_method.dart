import 'package:flutter/material.dart';
import '../../../global_widgets/custom_divider.dart';
import '../../../global_widgets/custom_icon_button.dart';
import '../../../global_widgets/sub_header.dart';
import '../../../utils/colors.dart';
import 'package:themify_flutter/themify_flutter.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SubHeader(
            title: "Payment Method",
            actionText: "",
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Themify.credit_card,
                color: CustomColors.primaryDarkColor,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  "Master Card ending **00",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                    color: CustomColors.primaryDarkColor,
                  ),
                ),
              ),
              CustomIconButton(
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 10.0),
          CutsomDivider(
            width: MediaQuery.of(context).size.width * 0.9,
          )
        ],
      ),
    );
  }
}
