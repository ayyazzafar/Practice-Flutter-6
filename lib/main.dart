import 'package:flutter/material.dart';


void main()=> runApp(HomePage());


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Custom shapes'),),
        body: Padding(padding: EdgeInsets.all(8.0),
        child: 
          CustomPaint(
            painter: ShapesPainter(),
            child: Container( )
          )
        ,),
      ),
    );
  }
}


class ShapesPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    
      final paint = Paint();

      paint.color = Colors.white;
      var rect =  Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawRect(rect, paint);


      

      paint.color = Colors.yellow;
      var path = Path();
      path.lineTo(0, size.height);
      path.lineTo(size.width, 0);

      path.close();

      canvas.drawPath(path, paint);


      paint.color = Colors.deepOrange;
      var center = Offset(size.width/2, size.height/2);
      canvas.drawCircle(center, 75.0, paint);

      
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}