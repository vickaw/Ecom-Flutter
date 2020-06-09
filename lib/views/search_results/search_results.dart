import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'widgets/filter_drawer.dart';
import 'widgets/result_list.dart';
import '../../utils/colors.dart';

class SearchResultsPage extends StatefulWidget {
  final String keyWord;

  const SearchResultsPage({Key key, this.keyWord}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController controller = new TextEditingController();
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> tabs = [
    "BEST MATCH",
    "TOP RATED",
    "PRICE(LOW - HIGH)",
    "PRICE(HIGH - LOW)",
  ];

  @override
  void initState() {
   setState(() {
    controller.text = widget.keyWord; 
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchBar = Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Something',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey,
        controller: controller,
      ),
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        primary: true,
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 4.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.left_chevron,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FlutterIcons.filter_outline_mco,
                color: Colors.black,
              ),
              onPressed: () => toggleDrawer(),
            )
          ],
          title: searchBar,
          bottom: TabBar(
            labelColor: CustomColors.headerColor,
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            unselectedLabelColor: CustomColors.headerColor.withOpacity(0.3),
            isScrollable: true,
            tabs: tabs
                .map(
                  (tab) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(tab.toUpperCase()),
                  ),
                )
                .toList(),
          ),
        ),
        body: Scaffold(
          key: _scaffoldKey,
          endDrawer: FilterDrawer(),
          body: TabBarView(
            children: tabs.map((tab) => SearchResultList(filter: tab)).toList(),
          ),
        ),
      ),
    );
  }

  toggleDrawer() {
    if (_scaffoldKey.currentState.isEndDrawerOpen) {
      Navigator.pop(context);
    } else {
      _scaffoldKey.currentState.openEndDrawer();
    }
  }
}
