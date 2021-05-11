import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydesktop/pages/home/home.dart';
import 'package:mydesktop/routers/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routers.home,
      getPages: Routers.getPages(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}
