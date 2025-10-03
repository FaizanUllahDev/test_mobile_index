import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_builder.dart';
import 'mobile/landing_mobile.dart';
import 'web/landing_web.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: LandingMobile(),
      web: LandingWeb(),
    );
  }
}
