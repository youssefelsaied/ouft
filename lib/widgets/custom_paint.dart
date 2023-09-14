import 'package:flutter/cupertino.dart';

import '../helpers/colors.dart';

class ButtonNotch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dotPoint = Offset(size.width / 2, 2);

    var paint_1 = Paint()
      ..color = kMainColor
      ..style = PaintingStyle.fill;
    var paint_2 = Paint()
      ..color = kWhiteColor
      ..style = PaintingStyle.fill;

    var path = Path();

    // path.moveTo(0, 0);
    // path.quadraticBezierTo(0, 0, 2.5, 5);
    // path.quadraticBezierTo(2.5, 5, 5, 10);
    // path.quadraticBezierTo(5, 10, 7.5, 5);
    // path.quadraticBezierTo(7.5, 5, 10, 0);
    // path.moveTo(0, size.height);
    // path.quadraticBezierTo(0, -10, 2.5, 5);
    // path.quadraticBezierTo(2.5, 5, 5, 10);
    // path.quadraticBezierTo(5, 10, 7.5, 5);
    // path.quadraticBezierTo(7.5, 5, 10, 0);
    path.moveTo(size.width * (.25), size.height);

    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.05,
      size.width / 2,
      0,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.05,
      size.width * (3 / 4),
      size.height,
    );
    // canvas.drawPath(path, paint);
    // path.quadraticBezierTo(0, -size.height, size.width/2 / 4, -size.height / 2);
    // path.quadraticBezierTo(size.width/2 / 4, -size.height / 2, size.width/2 / 2, 0);
    // path.quadraticBezierTo(
    //     size.width/2 / 2, 0, size.width/2 * (3 / 4), size.height);
    // path.quadraticBezierTo(size.width/2 / 2, size.height, size.width/2 / 2, 0);
    // path.quadraticBezierTo(0, 0, size.width/2 / 2, size.height);
    // path.quadraticBezierTo(size.width/2 / 2, size.height / 2, size.width/2 - 12, 5);
    // path.quadraticBezierTo(size.width/2 - 7.5, 0, size.width/2, 0);
    path.close();
    canvas.drawPath(path, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
