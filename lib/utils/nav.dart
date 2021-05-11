import 'package:get/get.dart';

/// 路由跳转
class Nav {
  static void jump(String name) {
    Get.toNamed(name);
  }
}
