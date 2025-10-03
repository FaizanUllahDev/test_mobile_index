import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.diagonal3Values(
          _isHovered ? 1.02 : 1.0,
          _isHovered ? 1.02 : 1.0,
          1.0,
        ),
     child: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             _isHovered ? AppColors.teal3 : AppColors.teal2,
             AppColors.blue2,
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         ),
         borderRadius: BorderRadius.circular(25),
       ),
       child: ElevatedButton(
         onPressed: widget.onPressed ?? () {},
         style: ElevatedButton.styleFrom(
           backgroundColor: Colors.transparent,
           foregroundColor: AppColors.white,
           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
           elevation: 0,
           shadowColor: Colors.transparent,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(25),
           ),
         ),
         child: Text(
           widget.text,
           style: const TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w600,
             letterSpacing: 0.5,
           ),
         ),
       ),
     ),
      ),
    );
  }
}
