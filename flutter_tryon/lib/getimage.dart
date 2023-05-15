import 'dart:convert';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'api.dart';

/*
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: _image ?? CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
*/

class ImageFromServer extends StatefulWidget {
  @override
  _ImageFromServerState createState() => _ImageFromServerState();
}

class _ImageFromServerState extends State<ImageFromServer> {
  var uri = Uri.parse(API.predict);
  Future<Uint8List> _getImageBytes() async {
    try {
      final response = await http.get(uri);
      print('여기는 지나감');
      return response.bodyBytes;
    } catch (e) {
      print('에러임');
      print('Error fetching image: $e');
      rethrow;
    }
  }

  Future<Uint8List> _getImageBytesFromJson(snapshotData) async {
    Map<String, dynamic> jsonResponse = jsonDecode(snapshotData);

    // 이미지 데이터를 jsonResponse에서 추출하고 디코딩합니다.
    String base64ImageData = jsonResponse['image_data'];
    Uint8List imageBytes = base64Decode(base64ImageData);

    return imageBytes;
  }

/*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          print('이미지 도착');
          print('이게 snapshot data : $snapshot.data');
          return Container(
            width: 500,
            height: 500,
            color: Colors.white,
            child: Image.memory(snapshot.data!),
          );
        } else if (snapshot.hasError) {
          print('이미지 도착 실패');
          print('Error loading image: ${snapshot.error}');
          return Text('Error loading image: ${snapshot.error}');
        } else {
          return Center(
            child: Container(
              width: 500,
              height: 500,
              color: Colors.white,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return FutureBuilder(
            future: _getImageBytesFromJson(snapshot.data),
            builder: (context, jsonSnapshot) {
              if (jsonSnapshot.connectionState == ConnectionState.done &&
                  jsonSnapshot.hasData) {
                return Container(
                  child: Image.memory(jsonSnapshot.data as Uint8List),
                );
              } else if (jsonSnapshot.hasError) {
                print('Error decoding JSON image data: ${jsonSnapshot.error}');
                return Text(
                    'Error decoding JSON image data: ${jsonSnapshot.error}');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        } else if (snapshot.hasError) {
          print('Error fetching image data: ${snapshot.error}');
          return Text('Error fetching image data: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
