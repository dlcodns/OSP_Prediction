import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
      Fluttertoast.showToast(msg: "Image not loaded");
      return;
    }

    final status = await Permission.storage.request();
    if (status.isGranted) {
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/downloaded_image.jpg');
      await file.writeAsBytes(_imageBytes!);
      Fluttertoast.showToast(msg: "Image saved to ${directory.path}");
    } else {
      Fluttertoast.showToast(msg: "Storage permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Server Image')),
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: _getImageBytes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _imageBytes = snapshot.data!;
              return Image.memory(snapshot.data!);
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
