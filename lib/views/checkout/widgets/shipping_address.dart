import 'package:flutter/material.dart';
import '../../../global_widgets/custom_divider.dart';
import '../../../global_widgets/custom_icon_button.dart';
import '../../../global_widgets/sub_header.dart';
import '../../../utils/colors.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SubHeader(
                    title: "Shipping Address",
                    actionText: "",
                    onPressed: () {},
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        color: CustomColors.primaryDarkColor,
                      ),
                    ),
                  ),
                  text("No 123 Sub Street,"),
                  text("Main Street,"),
                  text("City Name, Province,"),
                  text("Country"),
                ],
              ),
              CustomIconButton(
                onPressed: () {},
              )
            ],
          ),
          CutsomDivider(
            width: MediaQuery.of(context).size.width * 0.9,
          )
        ],
      ),
    );
  }

  Widget text(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          color: CustomColors.primaryDarkColor,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
