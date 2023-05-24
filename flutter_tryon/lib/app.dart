import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tryon/src/controller/bottom_nav_controller.dart';
import 'package:flutter_tryon/src/pages/imageselect/homepage.dart';
import 'package:flutter_tryon/src/pages/profile/profilepage.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  static const String routeName = '/app';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => App(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          //appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              HomePage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: BottomNavigationBar(
              //bottomnavigationbar에 있는 아이콘 안튀어오르게 함
              type: BottomNavigationBarType.fixed,
              //bottomnavigationbar에 있는 라벨 보이게 함
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.grey,
              elevation: 0,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                      // color: Colors.black,
                    ),
                    activeIcon: Icon(
                      CupertinoIcons.home,
                      color: Colors.black,
                    ),
                    label: "홈"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.calendar,
                      //color: Colors.black,
                    ),
                    activeIcon: Icon(
                      CupertinoIcons.calendar,
                      color: Colors.black,
                    ),
                    label: "예약현황"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.bars,
                      //color: Colors.black,
                    ),
                    activeIcon: Icon(
                      CupertinoIcons.bars,
                      color: Colors.black,
                    ),
                    label: "추가기능"),
              ],
            ),
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
