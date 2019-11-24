import 'package:flutter/material.dart';
import '../../../global_widgets/custom_card.dart';
import '../../../global_widgets/icon_list_tile.dart';
import 'package:themify_flutter/themify_flutter.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.16;

    final circularImage = Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.jane),
          fit: BoxFit.cover,
        ),
      ),
    );

    final name = Container(
      child: Text(
        "Jane Doe",
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w900,
          fontFamily: AppFonts.secondaryFont,
          color: CustomColors.primaryDarkColor,
        ),
      ),
    );

    final email = Container(
      child: Text(
        "janedoe123@email.com",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: CustomColors.primaryDarkColor,
        ),
      ),
    );

    final button = OutlineButton(
      onPressed: () {},
      child: Center(
        child: Text('EDIT PROFILE'),
      ),
      color: Theme.of(context).primaryColor,
      focusColor: Theme.of(context).primaryColor,
      highlightedBorderColor: Colors.grey.withOpacity(0.3),
      textColor: CustomColors.primaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[name, email, button],
    );

    final user = Container(
      child: Row(
        children: <Widget>[
          circularImage,
          SizedBox(
            width: 20.0,
          ),
          userDetails,
        ],
      ),
    );

    final firstOptions = CustomCard(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          IconListTile(
            iconData: Themify.list,
            title: "All My Orders",
          ),
          IconListTile(
            iconData: Themify.shopping_cart_full,
            title: "Pending Shipments",
          ),
          IconListTile(
            iconData: Themify.wallet,
            title: "Pending Payments",
          ),
          IconListTile(
            iconData: Themify.check_box,
            title: "Finished Orders",
          ),
        ],
      ),
    );

    final secondOptions = CustomCard(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          IconListTile(
            iconData: Themify.email,
            title: "Invite Friends",
          ),
          IconListTile(
            iconData: Themify.headphone_alt,
            title: "Customer Support",
          ),
          IconListTile(
            iconData: Themify.star,
            title: "Rate Our App",
          ),
          IconListTile(
            iconData: Themify.pencil_alt,
            title: "Make a Suggestion",
          ),
        ],
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final pageElements = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[user, spacer, firstOptions, spacer, secondOptions, spacer],
    );

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: pageElements,
      ),
    );
  }
}
