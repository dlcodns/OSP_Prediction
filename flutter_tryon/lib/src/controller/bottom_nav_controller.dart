import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';

enum PageName { HOME, VOTE, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  /** key를 통해 라우터 관리를 할 수 있다 */
  GlobalKey<NavigatorState> searchPageNaviationKey =
      GlobalKey<NavigatorState>();
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    //*스위치 문에서 여러 경우가 같은 의미를 나타낼 경우 HOME부터 적은 것처럼 묶어버리면 더 깔끔한 코드가 된다./*
    switch (page) {
      case PageName.HOME:
      case PageName.VOTE:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
    pageIndex(value);
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
          title: '시스템',
        ),
      );
      return true;
    } else {
      /**뒤로가기 하면 bottomnavigation history의 마지막 값을 지우면서 돌아간다 */
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      // print(bottomHistory);
      return false;
    }
  }
}
