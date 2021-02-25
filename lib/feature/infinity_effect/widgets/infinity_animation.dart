import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class InfinityAnimation extends StatefulWidget {
  const InfinityAnimation({
    Key key,
    this.duration = const Duration(milliseconds: 600),
  }) : super(key: key);

  final Duration duration;

  @override
  _InfinityAnimationState createState() => _InfinityAnimationState();
}

class _InfinityAnimationState extends State<InfinityAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
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
        return CustomPaint(
          painter: _InfinityPainter(controller: _controller),
          size: const Size(250.0, 250.0),
        );
      },
    );
  }
}

class _InfinityPainter extends CustomPainter {
  _InfinityPainter({this.controller})
      : super(
          repaint: controller,
        );
  final Animation<double> controller;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

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
          vector.radians(360 * controller.value),
        ),
      ).createShader(rect);

    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.50, size.height * 0.0);
    path_0.cubicTo(size.width * 0.68, size.height * 0.0, size.width * 1.0,
        size.height * 0.16, size.width * 1.0, size.height * 0.50);
    path_0.cubicTo(size.width * 1.0, size.height * 0.69, size.width * 0.83,
        size.height * 1.0, size.width * 0.50, size.height * 1.0);
    path_0.cubicTo(size.width * 0.31, size.height * 1.0, size.width * 0.0,
        size.height * 0.83, size.width * 0.0, size.height * 0.50);
    path_0.cubicTo(size.width * 0.0, size.height * 0.32, size.width * 0.17,
        size.height * 0.0, size.width * 0.50, size.height * 0.0);
    path_0.close();

    final Path path = Path.combine(
      PathOperation.reverseDifference,
      path_0,
      Path()..addRect(rect),
    );
    path.addRect(rect);
    canvas.drawPath(path_0, paintGradient);

    /* final Paint paint_1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
