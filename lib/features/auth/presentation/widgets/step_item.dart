import 'package:flutter/material.dart';
import 'package:test_mobile_index/core/theme/app_text_styles.dart';

class StepItem extends StatelessWidget {
  final String number;
  final String title;
  final Widget icon;
  final double iconSize;

  const StepItem({
    super.key,
    required this.number,
    required this.title,
    required this.icon,
    this.iconSize = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Large step number
          Text(
            number,
            style: AppTextStyles.stepNumber,
          ),
          const SizedBox(width: 24),

          // Title and illustration
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.stepTitle,
                  ),
                ),
                const SizedBox(width: 32),
                SizedBox(
                  width: iconSize,
                  height: iconSize * 0.6,
                  child: icon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
