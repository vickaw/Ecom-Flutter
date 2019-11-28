import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/utils.dart';
import '../../../models/review.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(
      width: screenWidth,
      height: screenHeight,
      allowFontScaling: true,
    )..init(context);
    final multiplier = screenHeight / screenWidth;


    return Container(
       margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12) * multiplier),
      child: ListView(
        children: reviews.map((review) {
          return reviewCard(review: review);
        }).toList(),
      ),
    );
  }

  Widget reviewCard({Review review}) {
    final color = AppFunctions.getRandomColor();

    final size = 60.0;

    final circle = Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          AppFunctions.getNameInitials(review.name),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );

    final ratingBar = RatingBarIndicator(
      direction: Axis.horizontal,
      rating: review.rating,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Theme.of(context).primaryColor,
      ),
      itemSize: 16.0,
    );

    final name = Text(
      review.name,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
    );

    final content = Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        review.content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final details = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ratingBar, name, content],
      ),
    );

    final date = Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        review.date,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.6),
        ),
      ),
    );

    return Container(
       margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: circle,
          ),
          Expanded(
            child: details,
            flex: 2,
          ),
          Expanded(
            child: date,
          )
        ],
      ),
    );
  }
}
