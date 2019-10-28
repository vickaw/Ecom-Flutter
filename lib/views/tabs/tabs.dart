import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../views/tabs/home/home.dart';
import '../../views/tabs/cart/cart.dart';
import '../../views/tabs/more/more.dart';
import '../../views/tabs/profile/profile.dart';
import '../../views/tabs/search/search.dart';
import '.../../../../global_widgets/custom_appbar.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeTab(),
    SearchTab(),
    CartTab(),
    ProfileTab(),
    MoreTab()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = CustomAppBar();

    final bottomNavBar = BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey.withOpacity(0.6),
      elevation: 0.0,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      items: [
        bottomNavItem(iconData: LineIcons.home, title: 'Home'),
        bottomNavItem(iconData: CupertinoIcons.search, title: 'Search'),
        bottomNavItem(iconData: LineIcons.shopping_cart, title: 'Cart'),
        bottomNavItem(iconData: LineIcons.user, title: 'Profile'),
        bottomNavItem(iconData: Icons.menu, title: 'More'),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }

  BottomNavigationBarItem bottomNavItem({
    @required IconData iconData,
    @required String title,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
