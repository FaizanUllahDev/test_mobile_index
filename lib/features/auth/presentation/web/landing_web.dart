import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/widgets/header_gradient_background.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_tab.dart';
import '../widgets/step_section_widget.dart';

const _maxContentWidth = 1500.0;

class LandingWeb extends StatefulWidget {
  const LandingWeb({super.key});

  @override
  State<LandingWeb> createState() => _LandingWebState();
}

class _LandingWebState extends State<LandingWeb> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _step1Key = GlobalKey();
  final GlobalKey _step2Key = GlobalKey();
  final GlobalKey _step3Key = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final GlobalKey? targetKey;
    switch (index) {
      case 0:
        targetKey = _step1Key;
        break;
      case 1:
        targetKey = _step2Key;
        break;
      case 2:
        targetKey = _step3Key;
        break;
      default:
        return;
    }

    if (targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                top: 10,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 140,
                  child: const AuthButton(text: 'login'),
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Main background gradient
                Positioned(
                  right: -880,
                  top: 0,
                  child: HeaderGradientBackground(
                    width: 3135,
                    height: 520,
                  ),
                ),
                // Main content container
                Center(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: _maxContentWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: _buildMainContent(context),
                    ),
                  ),
                ),
              ],
            ),
            // Tab bar section - moved outside header
            const SizedBox(height: 40),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.grey2.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 400,
                child: AuthTab(
                  onTabChanged: _scrollToSection,
                ),
              ),
            ),
            // Tab Sections TODO:

            // Steps section heading
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 80),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Drei einfache Schritte\nzu deinem neuen Job',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontSize: 32,
                                height: 1.3,
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Step 1 - Left aligned
            Stack(
              children: [
                Column(
                  children: [
                    StepSectionWidget(
                      sectionKey: _step1Key,
                      number: '1',
                      title: 'Erstellen dein Lebenslauf',
                      svgPath: 'assets/svg/undraw_Profile_data.svg',
                      alignRight: false,
                      backgroundColor: Colors.white,
                    ),
                    // Step 2 - Right aligned with teal background
                    StepSectionWidget(
                      sectionKey: _step2Key,
                      number: '2',
                      title: 'Erstellen dein Lebenslauf',
                      svgPath: 'assets/svg/undraw_task.svg',
                      alignRight: true,
                      backgroundColor: AppColors.teal1.withValues(alpha: 0.4),
                    ),
                    // Step 3 - Left aligned
                    StepSectionWidget(
                      sectionKey: _step3Key,
                      number: '3',
                      title: 'Mit nur einem Klick bewerben',
                      svgPath: 'assets/svg/undraw_personal_file.svg',
                      alignRight: false,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                _buildArrowConnector(false),
                _buildArrowConnector(true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowConnector(bool alignRight) {
    return Positioned(
      top: alignRight ? 900 : 400,
      left: !alignRight ? 450 : null,
      right: !alignRight ? null : 620,
      child: SvgPicture.asset(
        !alignRight
            ? 'assets/svg/arrow_line_down.svg'
            : 'assets/svg/arrow_left_toright_down.svg',
        width: 380,
        height: alignRight ? 240 : 300,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        // Responsive sizing
        final titleFontSize = screenWidth > 1400
            ? 72.0
            : screenWidth > 1200
                ? 60.0
                : 48.0;
        final buttonWidth = screenWidth > 1400
            ? 240.0
            : screenWidth > 1200
                ? 220.0
                : 200.0;
        final circleSize = screenWidth > 1400
            ? 400.0
            : screenWidth > 1200
                ? 350.0
                : 300.0;
        final iconSize = screenWidth > 1400
            ? 300.0
            : screenWidth > 1200
                ? 260.0
                : 220.0;
        final containerHeight = screenWidth > 1400
            ? 500.0
            : screenWidth > 1200
                ? 450.0
                : 400.0;

        return Column(
          children: [
            // Top section with heading and illustration
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left side with text and button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Deine Job\nwebsite',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: titleFontSize,
                            height: 1.1,
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: buttonWidth,
                      child: const AuthButton(text: 'Kostenlos Registrieren'),
                    ),
                  ],
                ),
                // Right side with illustration
                SizedBox(
                  height: containerHeight,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: circleSize,
                          height: circleSize,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: iconSize,
                          height: iconSize,
                          child: AppIcons.businessDeal,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
