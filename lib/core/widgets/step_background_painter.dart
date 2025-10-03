import 'package:flutter/material.dart';

class StepBackgroundPainter extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final bool isShowing;

  const StepBackgroundPainter({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.isShowing = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!isShowing) {
      return Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),
            child: child,
          ),
        ),
      );
    }
    return CustomPaint(
      size: Size(width, height),
      painter: _StepBackgroundCustomPainter(),
      child: child,
    );
  }
}

class _StepBackgroundCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFE6FFFA), // Light mint
          Color(0xFFB2F5EA), // Slightly darker mint
        ],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path path = Path();

    // Start from top-left
    path.moveTo(0, size.height * 0.2);

    // Top wavy line
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.3,
      size.width,
      size.height * 0.2,
    );

    // Right side
    path.lineTo(size.width, size.height * 0.8);

    // Bottom wavy line
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      size.width * 0.5,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      0,
      size.height * 0.8,
    );

    // Close the path
    path.close();

    // Draw the background
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Usage example:
// StepBackgroundPainter(
//   width: MediaQuery.of(context).size.width,
//   height: 400,
// )
