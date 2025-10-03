import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_mobile_index/core/widgets/responsive_builder.dart';
import 'package:test_mobile_index/core/widgets/step_background_painter.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/wave_gradient_background.dart';

class StepSectionWidget extends StatelessWidget {
  final GlobalKey sectionKey;
  final String number;
  final String title;
  final String svgPath;
  final bool alignRight;
  final Color? backgroundColor;

  const StepSectionWidget({
    super.key,
    required this.sectionKey,
    required this.number,
    required this.title,
    required this.svgPath,
    required this.alignRight,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    const maxContentWidth = 1500.0;
    final isStep2 = number == '2';

    final isMobile = ResponsiveBuilder.isMobile(context);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Main content with background
        StepBackgroundPainter(
          width: MediaQuery.of(context).size.width,
          height: 400,
          isShowing: isStep2,
          child: Container(
            key: sectionKey,
            width: double.infinity,
            color: isStep2 ? null : backgroundColor,
            padding: EdgeInsets.symmetric(
                vertical: isMobile ? (isStep2 ? 100 : 20) : 100,
                horizontal: 48),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxContentWidth),
                child: _buildStepContent(),
              ),
            ),
          ),
        ),
        // Curved arrow connector (except for last step)
        // if (number != '3') _buildArrowConnector(),
      ],
    );
  }

  Widget _buildStepContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < 768;

        final imgWidth = 280.0;
        final imgHeight = 200.0;

        // Mobile layout - Column
        if (isMobile) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Number and title in a row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$number.',
                        style: TextStyle(
                          fontSize: 64,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF718096).withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Illustration below
                  Center(
                    child: SvgPicture.asset(
                      svgPath,
                      width: 200,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Desktop layout - Row
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.center,
            children: [
              Spacer(),
              // Show illustration on right side if alignRight is true
              if (alignRight) ...[
                SvgPicture.asset(
                  svgPath,
                  width: imgWidth,
                  height: imgHeight,
                ),
                const SizedBox(width: 100),
              ],
              // Large step number
              Text(
                '$number.',
                style: TextStyle(
                  fontSize: 180,
                  height: 1,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF718096).withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: 24),
              // Title and illustration
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: alignRight ? 15.0 : 25.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                  // Show illustration on left side if alignRight is false
                  if (!alignRight) ...[
                    const SizedBox(width: 100),
                    SvgPicture.asset(
                      svgPath,
                      width: imgWidth,
                      height: imgHeight,
                    ),
                  ],
                ],
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

// Widget _buildArrowConnector() {
//   return Positioned(
//     top: 400,
//     left: !alignRight ? 450 : null,
//     right: !alignRight ? null : 450,
//     child: SvgPicture.asset(
//       !alignRight
//           ? 'assets/svg/arrow_line_down.svg'
//           : 'assets/svg/arrow_left_toright_down.svg',
//       width: 350,
//       height: 200,
//     ),
//   );
// }
}
