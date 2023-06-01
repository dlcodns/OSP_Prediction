import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color(0xffE3DCFF),
          elevation: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30),
                child: Image.asset(
                  'assets/logo.png',
                  width: 220,
                  height: 44,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 0.0, top: 30),
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
                padding: const EdgeInsets.only(right: 5.0, top: 30),
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
        body: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}


class _MainState extends State<Main> {
  String? selectedImagePath = null;
  
  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    }
  }
  
  String getFileName(String? path) {
    if (path == null) {
      return '';
    }
    return path.split('/').last;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3DCFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF4F1FF),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '신체 이미지 업로드',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      height: 0.001,
                                      color: Color(0xff404040),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(top: 0, bottom: 0),
                                      minimumSize: Size(0, 0),
                                    ),
                                    onPressed: () {

                                    },
                                    child: Text(
                                      '저장된 이미지 불러오기',
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 0.7,
                                        color: Color(0xff587CFF),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () async {
                                  final imagePath = await pickImage();
                                  setState(() {
                                    selectedImagePath = imagePath!;
                                  });
                                },
                                child: Image.asset(
                                  'assets/upload.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: selectedImagePath != null
                          ? Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${getFileName(selectedImagePath)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF4F1FF),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '의상 이미지 업로드',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff404040),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () async {
                                  final imagePath = await pickImage();
                                  setState(() {
                                    selectedClothesImagePath = imagePath!;
                                  });
                                },
                                child: Image.asset(
                                  'assets/upload.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: selectedClothesImagePath != null
                          ? Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${getFileName(selectedClothesImagePath)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Container(
            padding: EdgeInsets.only(left: 135, right: 135),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                backgroundColor: Color(0xff8C72F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                'Fitting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '* 신체 이미지는 정면을 제공해 주세요.\n* 신체를 크게 가리는 의상은 결과가 명확하지 않을 수 있습니다.\n* 의상은 구김이 적고 정확하게 표현된 사진을 제공해 주세요.\n* 의상 이미지 배경이 이미지 색과 유사하면 인식이 어려울 수 있습니다.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff606060),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
