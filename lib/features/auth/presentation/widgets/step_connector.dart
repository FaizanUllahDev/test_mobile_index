import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StepConnector extends StatelessWidget {
  final bool isReversed;

  const StepConnector({
    super.key,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: isReversed ? -50 : null,
      left: isReversed ? null : -50,
      top: isReversed ? -20 : 20,
      child: SvgPicture.asset(
        isReversed
            ? 'assets/svg/arrow_left_toright_down.svg'
            : 'assets/svg/arrow_line_down.svg',
        width: isReversed ? 200 : 250,
      ),
    );
  }
}
