import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:ui' show lerpDouble;

void main() {
  runApp(new AnimDemo());
}

class AnimDemo extends StatelessWidget {
  build(context) {
    return new MaterialApp(
      title: "Flutter Demo",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final random = new Random();
  int dataSet = 0;

  AnimationController animation;
  double startHeight;
  double currentHeight;
  double endHeight;

  initState() {
    super.initState();
    animation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {
          currentHeight = lerpDouble(startHeight, endHeight, animation.value);
        });
      });
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
  }

  dispose() {
    animation.dispose();
    super.dispose();
  }

  changeData() {
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
    });
  }

  @override
  build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 100.0),
          painter: new BarChartPainter(currentHeight),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  final double barHeight;

  BarChartPainter(this.barHeight);

  paint(canvas, size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        new Rect.fromLTWH(size.width - barWidth / 2.0,
            size.height - barHeight,
            barWidth,
            barHeight),
        paint);
  }

  shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}
