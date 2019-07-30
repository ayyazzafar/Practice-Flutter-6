import 'dart:math';
import 'dart:ui';

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
      body: HomeContent()
    );
  }
}

class HomeComponent extends StatefulWidget{

  @override
  _HomeComponentState createState() {
    // TODO: implement createState
    return _HomeComponentState();
  }
}

class _HomeComponentState extends State<HomeComponent>{
  double  percentage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    percentage  = 0.0;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: CustomPaint(
          foregroundPainter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{

  Color lineColor;
  Color completeColor;
  double completePercentage;
  double width;

  MyPainter( 
    {
      this.lineColor,
      this.completeColor,
      this.completePercentage,
      this.width
    }
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint line  = Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Paint complete  = Paint()
    ..color = completeColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2);
    canvas.drawCircle(center, radius, line);

    double arcAngle = 2*pi*(completePercentage/100);
    canvas.drawArc(Rect.fromCircle( center: center,radius: radius), - pi/2, arcAngle, false, complete);

   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}