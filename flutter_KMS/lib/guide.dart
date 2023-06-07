import 'package:flutter/material.dart';
import 'package:flutter_kms/main.dart';

void main() {
  runApp(MyGuide());
}

class MyGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guide',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        body: Builder(
          builder: (BuildContext context) {
            final screenHeight = MediaQuery.of(context).size.height;
            final screenWidth = MediaQuery.of(context).size.width;
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: const Color(0x40000000),
                  ),
                ),
                MediaQuery(
                  data: MediaQuery.of(context),
                  child: Guide(
                    title: 'Guide',
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Guide extends StatefulWidget {
  final String title;
  final double screenHeight;
  final double screenWidth;

  Guide({required this.title, required this.screenHeight, required this.screenWidth});

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<String> imagePaths = [
    'assets/guide1.png',
    'assets/guide2.png',
    'assets/guide3.png',
    'assets/guide4.png',
  ];

  List<List<TextSpan>> pageTextSpans = [
    [
      TextSpan(
        text: '\n‘Fitting Room’', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: ' 고객의 신체 이미지와\n 의상의 이미지를 매칭하여 가상 피팅을\n 제공하는 앱 서비스 입니다.', style: TextStyle(color: Colors.black,)
      )
    ],
    [
      TextSpan(
        text: 'step 1. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n고객님의 신체 이미지를 저장하여\n 신체 정보를 제공해 주세요!', style: TextStyle(color: Colors.black, )
      ),
    ],
    [
      TextSpan(
        text: 'step 2. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n착장하고 싶은 의상의 이미지를\n 업로드해 주세요!', style: TextStyle(color: Colors.black, )
      ),
    ],
    [
      TextSpan(
        text: 'step 3. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n의상과 고객님의 신체 정보를 조합하여\n 피팅된 이미지를 제공합니다.', style: TextStyle(color: Colors.black, )
      ),
    ],
    [
      TextSpan(
        text: '\nFitting Room을 이용하여\n 지금 바로 착장해 보세요!', style: TextStyle(fontSize: 30, color: Colors.black, )
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final appBarHeight = widget.screenHeight * 0.1;
    final tabItemSize = widget.screenWidth * 0.1;
    final pageTextFontSize = widget.screenWidth * 0.055;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: AppBar(
              toolbarHeight: appBarHeight,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: widget.screenHeight * 0.03,
                      left: widget.screenWidth * 0.04,
                      right: widget.screenWidth * 0.02,
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 220,
                      height: 44,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: widget.screenHeight * 0.03,
                      left: widget.screenWidth * 0.01,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings_backup_restore,
                        color: Color(0xff404040),
                        size: 35,
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: widget.screenHeight * 0.03,
                      left: widget.screenWidth * 0.01,
                      right: widget.screenWidth * 0.02,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Color(0xff404040),
                        size: 35,
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.white, width: 0.0
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabItem(0, Icons.circle, tabItemSize),
                  _buildTabItem(1, Icons.circle, tabItemSize),
                  _buildTabItem(2, Icons.circle, tabItemSize),
                  _buildTabItem(3, Icons.circle, tabItemSize),
                  _buildTabItem(4, Icons.circle, tabItemSize),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 0.0
                ),
                color: Colors.white,
              ),
              child: Center(
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
                          padding: EdgeInsets.only(
                            top: widget.screenHeight * 0.1,
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: pageTextSpans[index],
                                style: TextStyle(fontSize: pageTextFontSize),
                              ),
                            ),
                          ),
                        ),
                        if (index != 4)
                          Expanded(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                  bottom: widget.screenHeight * 0.2,
                                ),
                                child: Image.asset(
                                  imagePaths[index],
                                ),
                              ),
                            ),
                          ),
                        if (index == 4)
                          Container(
                            padding: EdgeInsets.only(
                              top: widget.screenHeight * 0.15,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  top: widget.screenWidth * 0.04,
                                  bottom: widget.screenWidth * 0.04,
                                  left: widget.screenWidth * 0.17,
                                  right: widget.screenWidth * 0.17,
                                ),
                                textStyle: TextStyle(
                                  fontSize: pageTextFontSize * 1.2,
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
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int pageIndex, IconData icon, double size) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          size: 12,
          color: _currentPage == pageIndex ? Color(0xff6744F2) : Color(0xffD9D9D9),
        ),
      ),
    );
  }
}
