import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mypage',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.menu, color: Color(0xff404040), size: 30),
                Text('  마이페이지',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: My(),
      ),
    );
  }
}

class My extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<My> {
  String? selectedMyImagePath = null;

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
  Widget build(BuildContext context){
    return ListView(
      children: [
        Expanded(
          child: SizedBox(
            height: 330,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE3DCFF),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right:40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xffD3CCEC),
                                width: 2,
                              ),
                            ),
                            child:  Icon(
                              Icons.settings,
                              color: Color(0xffB2ADC6),
                              size: 35,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
