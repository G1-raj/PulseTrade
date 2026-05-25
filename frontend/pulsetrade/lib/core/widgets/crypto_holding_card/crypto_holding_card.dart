import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/theme/theme.dart';

class CryptoHoldingCard extends StatelessWidget {

  final String cryptoName;
  final String symbol;
  final double currentPrice;
  final double investedAmount;
  final double percentageChange;
  final Color color;

  const CryptoHoldingCard({
    super.key,
    required this.cryptoName,
    required this.symbol,
    required this.currentPrice,
    required this.investedAmount,
    required this.percentageChange,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    final bool isProfit = percentageChange >= 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [

          // 🪙 Crypto Icon
          Container(
            width: 52,
            height: 52,

            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),

            child: Center(
              child: Text(
                symbol,

                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // 📊 Crypto Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Crypto Name
                Text(
                  cryptoName,

                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.buttonTextColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Current Price
                Text(
                  "\$${currentPrice.toStringAsFixed(2)}",

                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.greyTextColor,
                  ),
                ),
              ],
            ),
          ),

          // 💰 Investment Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // Invested Amount
              Text(
                "\$${investedAmount.toStringAsFixed(0)}",

                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.buttonTextColor,
                ),
              ),

              const SizedBox(height: 6),

              // Profit/Loss Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: isProfit
                      ? Colors.green.withOpacity(0.15)
                      : Colors.red.withOpacity(0.15),

                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(
                      isProfit
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,

                      size: 12,

                      color: isProfit
                          ? Colors.green
                          : Colors.red,
                    ),

                    const SizedBox(width: 3),

                    Text(
                      "${percentageChange.toStringAsFixed(1)}%",

                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,

                        color: isProfit
                            ? Colors.green
                            : Colors.red,
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


