import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<ExactAssetImage> images;

  const Carousel({Key key, this.images}) : super(key: key);

  @override
  State createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  PageController _controller = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.images.length; i++) {
      list.add(
        i == _currentPage
            ? dotIndicator(isActive: true, index: i)
            : dotIndicator(isActive: false, index: i),
      );
    }
    return list;
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  switchToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      physics: AlwaysScrollableScrollPhysics(),
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      controller: _controller,
      children: widget.images.map((image) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );

    final indicators = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );

    final bottom = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.grey[800].withOpacity(0.5),
        ),
        child: indicators,
      ),
    );

    return Stack(
      children: <Widget>[pageView, bottom],
    );
  }

  dotIndicator({bool isActive, int index}) {
    double size = isActive ? 24.0 : 12.0;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: InkWell(onTap: () => switchToPage(index)),
    );
  }
}
