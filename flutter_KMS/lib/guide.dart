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
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color(0x40000000),
              ),
            ),
            Guide(title: 'Guide'),
          ],
        ),
      ),
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

  List<String> imagePaths = [
    'assets/guide1.png',
    'assets/guide2.png',
    'assets/guide3.png',
    'assets/guide4.png',
  ];

  List<List<TextSpan>> pageTextSpans = [
    [
      TextSpan(
        text: '‘Fitting Room’', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: ' 고객의 신체 이미지와\n 의상의 이미지를 매칭하여 가상 피팅을\n 제공하는 앱 서비스 입니다.',
      )
    ],
    [
      TextSpan(
        text: 'step 1. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n고객님의 신체 이미지를 저장하여\n 신체 정보를 제공해 주세요! ',
      ),
    ],
    [
      TextSpan(
        text: 'step 2. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n착장하고 싶은 의상의 이미지를\n 업로드해 주세요! ',
      ),
    ],
    [
      TextSpan(
        text: 'step 3. ', style: TextStyle(color: Color(0xff6744F2)),
      ),
      TextSpan(
        text: '\n의상과 고객님의 신체 정보를 조합하여\n 피팅된 이미지를 제공합니다. ',
      ),
    ],
    [
      TextSpan(
        text: '\nFitting Room을 이용하여\n 지금 바로 착장해 보세요!',
        style: TextStyle(fontSize: 30),
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: AppBar(
              toolbarHeight: 120,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 53),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 220,
                      height: 44,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 45),
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
                    padding: const EdgeInsets.only(right: 30.0, top: 45),
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
            flex: 20,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage()),
                              );
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
    );
  }

  Widget _buildTabItem(int pageIndex, IconData icon) {
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
