import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffE3DCFF),
          elevation: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50),
                child: Image.asset(
                  'assets/logo.png',
                  width: 184,
                  height: 36,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
} 
