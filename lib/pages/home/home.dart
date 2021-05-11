import 'package:flutter/material.dart';
import 'package:mydesktop/components/Tapped.dart';
import 'package:mydesktop/routers/routers.dart';
import 'package:mydesktop/utils/font.dart';
import 'package:mydesktop/utils/nav.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Map<String, dynamic>> list = [
    {"title": "shell连接", "type": "shell"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ..._genItem(),
        ],
      ),
    );
  }

  List<Widget> _genItem() {
    return list
        .map(
          (e) => Tapped(
            key: Key(e["title"]),
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  e["title"],
                  style: TextStyle(
                    fontSize: Font.font_20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {
              switch (e["type"]) {
                case "shell":
                  Nav.jump(
                    Routers.shell,
                  );
                  break;
              }
            },
          ),
        )
        .toList();
  }
}
