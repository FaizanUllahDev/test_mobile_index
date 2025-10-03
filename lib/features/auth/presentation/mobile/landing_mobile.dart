import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_tab.dart';
import '../widgets/step_section_widget.dart';

class LandingMobile extends StatefulWidget {
  const LandingMobile({super.key});

  @override
  State<LandingMobile> createState() => _LandingMobileState();
}

class _LandingMobileState extends State<LandingMobile> {
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Header section with illustration and title
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.blue1.withValues(alpha: 0.3),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 140,
                        child: const AuthButton(text: 'login'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Deine Job\nwebsite',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 36,
                            height: 1.1,
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    AppIcons.buildSvg('undraw_agreement_aajr'),
                    // Title

                    const SizedBox(height: 24),
                    // Button
                    AuthButton(text: 'Kostenlos Registrieren'),
                  ],
                ),
              ),
              // Progress indicators and tabs
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // const SizedBox(height: 16),
                    // // Progress dots
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     _buildProgressDot(true, 'Anmelden'),
                    //     const SizedBox(width: 16),
                    //     _buildProgressDot(false, 'Registrieren'),
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    // Tab bar
                    AuthTab(
                      onTabChanged: _scrollToSection,
                    ),
                  ],
                ),
              ),
              // Steps section heading
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Drei einfache Schritte\nzu deinem neuen Job',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 24,
                                height: 1.3,
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              // Step sections using StepSectionWidget
              StepSectionWidget(
                sectionKey: _step1Key,
                number: '1',
                title: 'Erstellen dein Lebenslauf',
                svgPath: 'assets/svg/undraw_Profile_data.svg',
                alignRight: false,
                backgroundColor: Colors.white,
              ),
              StepSectionWidget(
                sectionKey: _step2Key,
                number: '2',
                title: 'Erstellen dein Lebenslauf',
                svgPath: 'assets/svg/undraw_task.svg',
                alignRight: false,
                backgroundColor: Colors.white,
              ),
              StepSectionWidget(
                sectionKey: _step3Key,
                number: '3',
                title: 'Mit nur einem Klick bewerben',
                svgPath: 'assets/svg/undraw_personal_file.svg',
                alignRight: false,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressDot(bool isActive, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColors.teal2 : AppColors.grey4,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? AppColors.teal3 : AppColors.grey3,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
