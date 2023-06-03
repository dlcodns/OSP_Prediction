import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:local/src/pages/image/mainpage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../api/api.dart';

class ImageFromServer extends StatefulWidget {
  @override
  _ImageFromServerState createState() => _ImageFromServerState();
}

class _ImageFromServerState extends State<ImageFromServer> {
  var uri = Uri.parse(API.predict);
  Uint8List? _imageBytes;

  Future<Uint8List> _getImageBytes() async {
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Extract and decode the image data from jsonResponse
        String base64ImageData = jsonResponse['image_data'];
        Uint8List imageBytes = base64Decode(base64ImageData);

        return imageBytes;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching image: $e');
      rethrow;
    }
  }

  Future<void> _saveImage() async {
    if (_imageBytes == null) {
      Fluttertoast.showToast(msg: "이미지 다운로드에 실패했습니다");
      return;
    }

    final status = await Permission.storage.request();
    if (status.isGranted) {
      final extDir = await getExternalStorageDirectory();
      final picturesDir = Directory('${extDir!.path}/Pictures');
      if (!await picturesDir.exists()) {
        await picturesDir.create(recursive: true);
      }
      final filePath = '${picturesDir.path}/downloaded_image.jpg';
      final file = File(filePath);
      await file.writeAsBytes(_imageBytes!);
      Fluttertoast.showToast(msg: "갤러리에 이미지가 저장되었습니다");
    } else {
      Fluttertoast.showToast(msg: "Storage permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3DCFF),
      appBar: AppBar(
        title: Text('JSON Server Image'),
        backgroundColor: Color(0xff6744F2),
      ),
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: _getImageBytes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _imageBytes = snapshot.data!;
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.memory(snapshot.data!),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(MainPage());
                        },
                        child: Container(
                          color: Colors.white,
                          width: 100,
                          height: 50,
                          child: Center(child: Text('홈으로 돌아가기')),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveImage,
        child: Icon(Icons.download),
        tooltip: 'Download Image',
      ),
    );
  }
}
