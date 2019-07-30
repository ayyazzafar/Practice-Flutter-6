import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Experiments',
      theme: ThemeData(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Flutter Experiments',
            style: TextStyle(color: Colors.white, letterSpacing: 1.0)),
        backgroundColor: new Color(0xFF2979FF),
        centerTitle: true,
      ),
      body: CustomPaint(
  painter: Sky(),
  child: Center(
    
  ),
)
    );
  }
}


class Sky extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final radius = min(size.width, size.height)/3;
    final center = Offset(size.width/2, size.height/2);
    // Draw the body
    final paint = Paint()..color= Colors.orange[300];
    canvas.drawCircle(center, radius, paint);
    // Draw the mouth
    final smilePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 20
    ..strokeCap=StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center:center, radius: radius/2), 0, pi/1.5, false, smilePaint);
    // Draw the eyes
    canvas.drawCircle(Offset(center.dx-radius /2.8, center.dy-radius/3), 20, Paint());
    canvas.drawCircle(Offset(center.dx+radius /2.8, center.dy-radius/3), 20, Paint());
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}