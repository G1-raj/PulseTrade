import 'package:flutter/material.dart';
import 'package:pulsetrade/core/theme/theme.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPress;
  const AppButton(
    {
      super.key,
      required this.width,
      required this.height,
      this.onPress
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.8,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: onPress, 
        style: ElevatedButton.styleFrom(
          foregroundColor: AppTheme.buttonTextColor,
          backgroundColor: AppTheme.mainButtonColor,
          elevation: 3
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.05
              ),
            ),
    
            const SizedBox(width: 7,), 
            Icon(Icons.arrow_forward_rounded, size: width * 0.05,)
          ],
        )
      ),
    );
  }
}