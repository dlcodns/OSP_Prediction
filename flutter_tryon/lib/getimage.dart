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
  Future<Uint8List> getImageFromServer() async {
    var uri = Uri.parse(API.predict);
    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "이미지가 도착했습니다!");
        print("이미지가 도착했습니다");
        final bytes = response.bodyBytes;
        return bytes;
      } else {
        Fluttertoast.showToast(msg: "실패했습니다..");
        print("실패했습니다");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
    }
    return Uint8List(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: getImageFromServer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.memory(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
