import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentPageIndex = 1.obs;

  void updatePageIndex(int index) {
    currentPageIndex.value = index;
  }
}
