import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'api.dart';

class GetImagePage extends StatefulWidget {
  const GetImagePage({super.key});

  @override
  State<GetImagePage> createState() => _GetImagePageState();
}

class _GetImagePageState extends State<GetImagePage> {
  Image? _image;

  @override
  void initState() {
    super.initState();
    getImageFromServer();
  }

  Future<void> getImageFromServer() async {
    var uri = Uri.parse(API.predict);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var imageBytes = response.bodyBytes;
        setState(() {
          _image = Image.memory(imageBytes);
        });
      } else {
        Fluttertoast.showToast(msg: "이미지 검색에 실패했습니다..");
        print("이미지 검색에 실패했습니다");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _image ?? CircularProgressIndicator(),
      ),
    );
  }
}
