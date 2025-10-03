import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? web;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.web,
  });




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        }
        return web ?? mobile;
      },
    );
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
}
