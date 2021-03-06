import 'package:flutter/material.dart';

/// 点击
class Tapped extends StatelessWidget {
  final Widget child;
  final Function onTap;
  Tapped({required this.child, required this.onTap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: child,
    );
  }
}
