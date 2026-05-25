import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/theme/theme.dart';

class PortfolioCard extends StatelessWidget {
  final double width;
  final double height;

  final double portfolioValue;
  final double todayChange;

  const PortfolioCard({
    super.key,
    required this.width,
    required this.height,
    required this.portfolioValue,
    required this.todayChange,
  });

  @override
  Widget build(BuildContext context) {

    final bool isProfit = todayChange >= 0;

    return Container(
      width: width * 0.95,
      height: height * 0.14,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.mainButtonColor,
            AppTheme.backgroundColor,
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // 📊 Left Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Portfolio Value",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "\$${portfolioValue.toStringAsFixed(2)}",
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // 📈 Right Section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                "Today",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),

              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: isProfit
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),

                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(
                      isProfit
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      size: 14,
                      color: isProfit ? Colors.green : Colors.red,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      "${todayChange.toStringAsFixed(2)}%",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isProfit ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}