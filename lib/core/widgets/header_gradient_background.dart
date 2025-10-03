import 'package:flutter/material.dart';

class HeaderGradientBackground extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const HeaderGradientBackground({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HeaderGradientPainter(),
      size: Size(width ?? 3135, height ?? 659),
      child: child,
    );
  }
}

class HeaderGradientPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  HeaderGradientPainter({
    this.startColor = const Color(0xFFEBF4FF),
    this.endColor = const Color(0xFFE6FFFA),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: const Alignment(0.7, 0.3), // Approximately 102 degrees
        colors: [startColor, endColor],
      ).createShader(rect);

    final path = Path();

    // Draw curved path for the header background
    path.moveTo(0, 0);

    // Top edge with curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.1,
      size.width,
      0,
    );

    // Right side
    path.lineTo(size.width, size.height);

    // Bottom edge with curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.9,
      0,
      size.height,
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderGradientPainter oldDelegate) =>
      oldDelegate.startColor != startColor || oldDelegate.endColor != endColor;
}
