import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clothimagepick.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '이미지 페이지로',
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
