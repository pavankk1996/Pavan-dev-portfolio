import 'package:flutter/material.dart';

class DevSizeBox extends StatelessWidget {
  final double width;
  final double height;
  const DevSizeBox({this.width=12, this.height=12, super.key});  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}