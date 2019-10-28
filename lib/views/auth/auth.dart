import 'package:flutter/material.dart';
import 'forgot_password/forgot_password.dart';
import 'login/login.dart';
import 'signup/signup.dart';
import 'widgets/tab_bar_head.dart';
import '../../utils/colors.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = ["Log In", "Sign Up", "Forgot Password"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: CustomColors.headerColor,
      unselectedLabelColor: CustomColors.headerColor.withOpacity(0.3),
      isScrollable: true,
      tabs: tabs
      .map((tabName) => Tab(child: TabBarHead(tabBarName: tabName)))
      .toList(),
    );

    final tabBarView = Container(
      height: screenHeight * 0.80,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: TabBarView(
        controller: tabController,
        children: <Widget>[LoginPage(), SignUpPage(), ForgotPasswordPage()],
      ),
    );

    final pageElements = Column(
      children: <Widget>[tabBar, tabBarView],
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50.0),
          child: pageElements,
        ),
      ),
    );
  }
}
