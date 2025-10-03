import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AuthTab extends StatefulWidget {
  final Function(int)? onTabChanged;

  const AuthTab({super.key, this.onTabChanged});

  @override
  State<AuthTab> createState() => _AuthTabState();
}

class _AuthTabState extends State<AuthTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.grey2.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildTab('Arbeitnehmer', 0),
          _buildTab('Arbeitgeber', 1),
          _buildTab('Temporärbüro', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedIndex = index);
          widget.onTabChanged?.call(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.blue2 : AppColors.grey3,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
