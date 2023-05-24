import 'package:flutter/material.dart';
import 'package:flutter_tryon/src/pages/imageselect/modelimagepick.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../api/api.dart';

class ClothImagePickingPage extends StatefulWidget {
  ClothImagePickingPage({super.key});

  @override
  State<ClothImagePickingPage> createState() => _ClothImagePickingPageState();
}

class _ClothImagePickingPageState extends State<ClothImagePickingPage> {
  XFile? pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> uploadImageToServer(XFile pickedImage) async {
    var uri = Uri.parse(API.clothupload);
    try {
      var request = http.MultipartRequest("POST", uri);
      var pic = await http.MultipartFile.fromPath("file", pickedImage.path);

      request.files.add(pic);

      var response = await request.send();

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "이미지가 업로드되었습니다!");
        print("이미지가 업로드되었습니다");
      } else {
        Fluttertoast.showToast(msg: "이미지 업로드에 실패했습니다..");
        print("이미지 업로드에 실패했습니다");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
    }
  }

  void updateImage() {
    setState(() {});
  }

  Widget _imageAvatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: pickedImage != null
                ? Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.cover,
                  )
                : Text('사진을 선택해주세요!'),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () async {
            pickedImage = await _picker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 30,
            );
            updateImage();
          },
          child: Text('이미지 변경'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //옷 넣는 곳
          Container(
            width: 400,
            height: 400,
            color: Colors.amber,
            child: _imageAvatar(),
          ),
          GestureDetector(
            onTap: () {
              if (pickedImage != null) {
                uploadImageToServer(pickedImage!);
                Get.to(() => ModelImagePickingPage());
              } else {
                Fluttertoast.showToast(msg: '이미지를 선택해주세요!');
              }
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Text('이미지 확정 후 다음 페이지로'),
            ),
          ),
        ],
      ),
    );
  }
}
