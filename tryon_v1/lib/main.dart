import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/src/pages/login/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'main',
      home: Scaffold(
        backgroundColor: const Color(0xff6744F2),
        body: HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return Stack(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/door.png',
                width: MediaQuery.of(context).size.width),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                child: IconButton(
              iconSize: MediaQuery.of(context).size.height * 0.08,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Image.asset('assets/start.png'),
            )),
          ),
        )
      ],
    );
  }
}
