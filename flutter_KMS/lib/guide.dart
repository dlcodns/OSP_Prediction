import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'guide',
      home: Guide(title: 'guide'),
    );
  }
}

class Guide extends StatefulWidget {
  final String title;

  Guide({required this.title});

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3DCFF),
      body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               SizedBox(
                 height: 200,
               ),
               Row(
                 children: [
                   Expanded(
                     child: Container(
                       height: 800,
                      
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
      ),
    );
  }
}
