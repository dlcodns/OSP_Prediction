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
            Expanded(
              flex: 6,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
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
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 60.0, bottom: 50.0),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: pageTextSpans[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        if (index != 4)
                          Expanded(
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Image.asset(
                                  imagePaths[index],
                                ),
                              ),
                            ),
                          ),
                        if (index == 4)
                          Container(
                            padding: EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 32.0,
                                ),
                                textStyle: TextStyle(
                                  fontSize: 24.0,
                                ),
                                backgroundColor: Color(0xff6744F2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
