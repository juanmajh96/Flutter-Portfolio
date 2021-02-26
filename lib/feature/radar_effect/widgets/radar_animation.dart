import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class RadarAnimation extends StatefulWidget {
  const RadarAnimation({
    Key key,
    this.duration = const Duration(milliseconds: 4300),
  }) : super(key: key);

  final Duration duration;

  @override
  _RadarAnimationState createState() => _RadarAnimationState();
}

class _RadarAnimationState extends State<RadarAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacity;
  Animation<double> _opacity90;
  Animation<double> _opacity270;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3),
      ),
    );
    _opacity90 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6),
      ),
    );
    _opacity270 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0),
      ),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Stack(
          children: <Widget>[
            CustomPaint(
              painter: RadarSearch(
                  controller: _controller,
                  opacity: _opacity,
                  opacity90: _opacity90,
                  opacity270: _opacity270),
              size: const Size(250.0, 250.0),
            ),
            RepaintBoundary(
              child: CustomPaint(
                painter: CanvasCoordinates(),
                size: const Size(250.0, 250.0),
              ),
            ),
          ],
        );
      },
    );
  }
}

class RadarSearch extends CustomPainter {
  RadarSearch({this.controller, this.opacity, this.opacity90, this.opacity270})
      : super(
          repaint: controller,
        );
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> opacity90;
  final Animation<double> opacity270;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final double _valueAnimation = -(360 * controller.value);

    final Paint paintGradient = Paint()
      ..shader = SweepGradient(
        tileMode: TileMode.clamp,
        colors: <Color>[
          Colors.green[400],
          Colors.green[100],
        ],
        startAngle: 0.0,
        endAngle: vector.radians(90),
        transform: GradientRotation(
          vector.radians(_valueAnimation),
        ),
      ).createShader(rect);

    final Path circleRect = Path();
    circleRect.moveTo(size.width * 0.50, size.height * 0.0);
    circleRect.cubicTo(size.width * 0.68, size.height * 0.0, size.width * 1.0,
        size.height * 0.16, size.width * 1.0, size.height * 0.50);
    circleRect.cubicTo(size.width * 1.0, size.height * 0.69, size.width * 0.83,
        size.height * 1.0, size.width * 0.50, size.height * 1.0);
    circleRect.cubicTo(size.width * 0.31, size.height * 1.0, size.width * 0.0,
        size.height * 0.83, size.width * 0.0, size.height * 0.50);
    circleRect.cubicTo(size.width * 0.0, size.height * 0.32, size.width * 0.17,
        size.height * 0.0, size.width * 0.50, size.height * 0.0);
    circleRect.close();

    final Path path = Path.combine(
      PathOperation.reverseDifference,
      circleRect,
      Path()..addRect(rect),
    );
    path.addRect(rect);
    canvas.drawPath(circleRect, paintGradient);

    final Paint paintPoint1 = Paint()
      ..color = _valueAnimation > -190
          ? Colors.red[400].withOpacity(opacity.value)
          : Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    final Paint paintPoint1Green = Paint()
      ..color = _valueAnimation > -190
          ? Colors.green[400].withOpacity(opacity.value)
          : Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    canvas.drawCircle(
      Offset(size.width / 1.2, size.height / 1.7),
      5,
      paintPoint1,
    );
    canvas.drawCircle(
      Offset(size.width / 1.4, size.height / 1.9),
      5,
      paintPoint1Green,
    );
    canvas.drawCircle(
      Offset(size.width / 1.2, size.height / 1.9),
      5,
      paintPoint1Green,
    );

    final Paint paintPoint3 = Paint()
      ..color = _valueAnimation < -80 && (_valueAnimation > -260)
          ? Colors.green[400].withOpacity(opacity90.value)
          : Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    canvas.drawCircle(
      Offset(size.width / 1.9, size.height / 3.5),
      5,
      paintPoint3,
    );
    canvas.drawCircle(
      Offset(size.width / 1.6, size.height / 3.2),
      5,
      paintPoint3,
    );

    final Paint paintPoint2 = Paint()
      ..color = _valueAnimation < -233 && (_valueAnimation > -340)
          ? Colors.green[400].withOpacity(opacity270.value)
          : Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    canvas.drawCircle(
      Offset(size.width / 3.9, size.height / 1.5),
      5,
      paintPoint2,
    );
    canvas.drawCircle(
      Offset(size.width / 3.7, size.height / 1.3),
      5,
      paintPoint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CanvasCoordinates extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintGreen = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path circle4 = Path();
    circle4.moveTo(size.width * 0.50, size.height * 0.0);
    circle4.cubicTo(size.width * 0.68, size.height * 0.0, size.width * 1.0,
        size.height * 0.16, size.width * 1.0, size.height * 0.50);
    circle4.cubicTo(size.width * 1.0, size.height * 0.69, size.width * 0.83,
        size.height * 1.0, size.width * 0.50, size.height * 1.0);
    circle4.cubicTo(size.width * 0.31, size.height * 1.0, size.width * 0.0,
        size.height * 0.83, size.width * 0.0, size.height * 0.50);
    circle4.cubicTo(size.width * 0.0, size.height * 0.32, size.width * 0.17,
        size.height * 0.0, size.width * 0.50, size.height * 0.0);
    circle4.close();

    canvas.drawPath(circle4, paintGreen);

    final Path circle3 = Path();
    circle3.moveTo(size.width * 0.50, size.height * 0.10);
    circle3.cubicTo(size.width * 0.66, size.height * 0.10, size.width * 0.90,
        size.height * 0.21, size.width * 0.90, size.height * 0.50);
    circle3.cubicTo(size.width * 0.90, size.height * 0.66, size.width * 0.78,
        size.height * 0.90, size.width * 0.50, size.height * 0.90);
    circle3.cubicTo(size.width * 0.35, size.height * 0.90, size.width * 0.11,
        size.height * 0.78, size.width * 0.11, size.height * 0.50);
    circle3.cubicTo(size.width * 0.11, size.height * 0.34, size.width * 0.22,
        size.height * 0.10, size.width * 0.50, size.height * 0.10);
    circle3.close();

    canvas.drawPath(circle3, paintGreen);

    final Path circle2 = Path();
    circle2.moveTo(size.width * 0.50, size.height * 0.20);
    circle2.cubicTo(size.width * 0.62, size.height * 0.20, size.width * 0.80,
        size.height * 0.29, size.width * 0.80, size.height * 0.50);
    circle2.cubicTo(size.width * 0.80, size.height * 0.62, size.width * 0.71,
        size.height * 0.80, size.width * 0.50, size.height * 0.80);
    circle2.cubicTo(size.width * 0.38, size.height * 0.80, size.width * 0.20,
        size.height * 0.71, size.width * 0.20, size.height * 0.50);
    circle2.cubicTo(size.width * 0.20, size.height * 0.38, size.width * 0.29,
        size.height * 0.20, size.width * 0.50, size.height * 0.20);
    circle2.close();

    canvas.drawPath(circle2, paintGreen);

    final Path circle1 = Path();
    circle1.moveTo(size.width * 0.50, size.height * 0.30);
    circle1.cubicTo(size.width * 0.58, size.height * 0.30, size.width * 0.70,
        size.height * 0.36, size.width * 0.70, size.height * 0.50);
    circle1.cubicTo(size.width * 0.70, size.height * 0.58, size.width * 0.64,
        size.height * 0.70, size.width * 0.50, size.height * 0.70);
    circle1.cubicTo(size.width * 0.42, size.height * 0.70, size.width * 0.30,
        size.height * 0.64, size.width * 0.30, size.height * 0.50);
    circle1.cubicTo(size.width * 0.30, size.height * 0.42, size.width * 0.36,
        size.height * 0.30, size.width * 0.50, size.height * 0.30);
    circle1.close();

    canvas.drawPath(circle1, paintGreen);

    final Path circle0 = Path();
    circle0.moveTo(size.width * 0.50, size.height * 0.38);
    circle0.cubicTo(size.width * 0.55, size.height * 0.38, size.width * 0.62,
        size.height * 0.41, size.width * 0.62, size.height * 0.50);
    circle0.cubicTo(size.width * 0.62, size.height * 0.55, size.width * 0.59,
        size.height * 0.62, size.width * 0.50, size.height * 0.62);
    circle0.cubicTo(size.width * 0.45, size.height * 0.62, size.width * 0.38,
        size.height * 0.59, size.width * 0.38, size.height * 0.50);
    circle0.cubicTo(size.width * 0.38, size.height * 0.45, size.width * 0.42,
        size.height * 0.38, size.width * 0.50, size.height * 0.38);
    circle0.close();

    canvas.drawPath(circle0, paintGreen);

    final Path line0 = Path();
    line0.moveTo(size.width * 0.50, size.height * 1.00);
    line0.lineTo(size.width * 0.50, size.height * 0.00);

    canvas.drawPath(line0, paintGreen);

    final Path line1 = Path();
    line1.moveTo(size.width * 0.31, size.height * 0.96);
    line1.lineTo(size.width * 0.69, size.height * 0.04);

    canvas.drawPath(line1, paintGreen);

    final Path line2 = Path();
    line2.moveTo(size.width * 0.15, size.height * 0.85);
    line2.lineTo(size.width * 0.85, size.height * 0.15);

    canvas.drawPath(line2, paintGreen);

    final Path line3 = Path();
    line3.moveTo(size.width * 0.96, size.height * 0.31);
    line3.lineTo(size.width * 0.04, size.height * 0.69);

    canvas.drawPath(line3, paintGreen);

    final Path line4 = Path();
    line4.moveTo(size.width, size.height * 0.50);
    line4.lineTo(size.width * 0.00, size.height * 0.50);

    canvas.drawPath(line4, paintGreen);

    final Path line5 = Path();
    line5.moveTo(size.width * 0.04, size.height * 0.31);
    line5.lineTo(size.width * 0.96, size.height * 0.69);

    canvas.drawPath(line5, paintGreen);

    final Path line6 = Path();
    line6.moveTo(size.width * 0.15, size.height * 0.15);
    line6.lineTo(size.width * 0.85, size.height * 0.85);

    canvas.drawPath(line6, paintGreen);

    final Path line7 = Path();
    line7.moveTo(size.width * 0.31, size.height * 0.04);
    line7.lineTo(size.width * 0.69, size.height * 0.96);

    canvas.drawPath(line7, paintGreen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
