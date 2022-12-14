import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 60);
    path.quadraticBezierTo(width / 2, height+50, width, height - 60);
    path.lineTo(width, 0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}