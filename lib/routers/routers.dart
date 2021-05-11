import 'package:get/get.dart';
import 'package:mydesktop/pages/home/home.dart';
import 'package:mydesktop/pages/home/shell/shell.dart';

class Routers {
  // 首页
  static final String home = '/home';
  // shell 页面
  static final String shell = '/shell';

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: home,
        page: () => MyHome(),
      ),
      GetPage(
        name: shell,
        page: () => Shell(),
      ),
    ];
  }
}
