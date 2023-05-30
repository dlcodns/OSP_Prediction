import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0xffE3DCFF),
          elevation: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50),
                child: Image.asset(
                  'assets/logo.png',
                  width: 220,
                  height: 44,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12.0, top: 45),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings_backup_restore,
                    color: Color(0xff404040),
                    size: 35,
                  ),
                  onPressed: () {

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 45),
                child: IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Color(0xff404040),
                    size: 35,
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
        body: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3DCFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Container(
            padding: EdgeInsets.only(left: 135, right: 135),
            child: ElevatedButton(
            ),
          ),
          Expanded(
            flex: 6,
          ),
          Expanded(
            flex: 4,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
