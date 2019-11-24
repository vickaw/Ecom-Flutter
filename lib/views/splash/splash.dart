import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_shop/router.dart';
import 'package:hello_shop/utils/colors.dart';
import 'package:hello_shop/utils/utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimer() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(authViewRoute);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logoWhite,
            height: 120.0,
          ),
        ),
      ),
    );
  }
}
