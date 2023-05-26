import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'guide',
      home: Guide(title: 'guide'),
    );
  }
}

class Guide extends StatefulWidget {
  final String title;

  Guide({required this.title});

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3DCFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem(0, Icons.circle),
                    _buildTabItem(1, Icons.circle),
                    _buildTabItem(2, Icons.circle),
                    _buildTabItem(3, Icons.circle),
                    _buildTabItem(4, Icons.circle),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 5,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
