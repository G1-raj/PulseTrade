import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/theme/theme.dart';

class BalanceCard extends StatelessWidget {
  final double width;
  final double height;

  const BalanceCard({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.95,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          // Title
          Text(
            "Total Balance",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              color: AppTheme.greyTextColor,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 6),

          // Balance
          Text(
            "\$48,250",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              color: AppTheme.textButtonColor,
              fontSize: 28,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 12),

          // Profit badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_upward_rounded,
                  size: 16,
                  color: Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  "+12% today",
                  style: GoogleFonts.inter(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}