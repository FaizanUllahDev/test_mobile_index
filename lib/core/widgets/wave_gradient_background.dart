import 'package:flutter/material.dart';

class WaveGradientBackground extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final bool isShowing;

  const WaveGradientBackground({
    super.key,
    this.width,
    this.height,
    this.child,
    this.isShowing = false,
  });

  @override
  Widget build(BuildContext context) {
    if(!isShowing) return child ?? const SizedBox.shrink();
    return CustomPaint(
      painter: WaveGradientPainter(),
      size: Size(width ?? double.infinity, height ?? 370),
      child: child,
    );
  }
}

class WaveGradientPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  WaveGradientPainter({
    this.startColor = const Color(0xFFE6FFFA),
    this.endColor = const Color(0xFFEBF4FF),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: const Alignment(0.8, 0.0), // Approximately 104 degrees
        colors: [startColor, endColor],
      ).createShader(rect);

    final path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // Draw the top wave
    final controlPoint1 = Offset(size.width * 0.25, -size.height * 0.05);
    final controlPoint2 = Offset(size.width * 0.75, size.height * 0.05);
    final endPoint = Offset(size.width, 0);

    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Complete the path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveGradientPainter oldDelegate) =>
      oldDelegate.startColor != startColor || oldDelegate.endColor != endColor;
}
