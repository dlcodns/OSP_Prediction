import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'imagepick/clothimagepick.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6744F2),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => ClothImagePickingPage());
                },
                child: Container(
                  width: 120,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '사진 선택하러 가기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
