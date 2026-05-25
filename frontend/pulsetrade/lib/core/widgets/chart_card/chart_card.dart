import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/theme/theme.dart';

class ChartCard extends StatefulWidget {
  final Map<String, double> cryptos;
  final double width;
  final double height;

  const ChartCard({
    super.key,
    required this.cryptos,
    required this.width,
    required this.height,
  });

  @override
  State<ChartCard> createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    // Start animation after small delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,

      width: widget.width * 0.95,
      height: widget.height * 0.28,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppTheme.cardColor,
      ),

      child: Row(
        children: [

          // 📊 PIE CHART
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [

                PieChart(
                  duration: const Duration(milliseconds: 1400),
                  curve: Curves.easeOutExpo,

                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 55,

                    sections: widget.cryptos.entries.map((entry) {

                      return PieChartSectionData(
                        value: startAnimation ? entry.value : 0,
                        title: startAnimation
                            ? "${entry.value.toInt()}%"
                            : "",

                        radius: startAnimation ? 60 : 0,

                        color: _getColor(entry.key),

                        titleStyle: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      );

                    }).toList(),
                  ),
                ),

                // 💰 Center Content
                AnimatedScale(
                  duration: const Duration(milliseconds: 900),
                  scale: startAnimation ? 1 : 0.5,
                  curve: Curves.easeOutBack,

                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 900),
                    opacity: startAnimation ? 1 : 0,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                          "Portfolio",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "\$48K",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.buttonTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 18),

          // 📋 LIST SECTION
          Expanded(
            flex: 4,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: widget.cryptos.entries.map((entry) {

                return AnimatedContainer(
                  duration: Duration(
                    milliseconds:
                        500 + (widget.cryptos.keys.toList().indexOf(entry.key) * 150),
                  ),

                  curve: Curves.easeOutCubic,

                  margin: const EdgeInsets.only(bottom: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      startAnimation ? 0.04 : 0,
                    ),

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: startAnimation ? 1 : 0,

                    child: Row(
                      children: [

                        // 🎨 Color Dot
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),

                          width: startAnimation ? 12 : 0,
                          height: startAnimation ? 12 : 0,

                          decoration: BoxDecoration(
                            color: _getColor(entry.key),
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // 🪙 Coin Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                entry.key,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.buttonTextColor,
                                ),
                              ),

                              const SizedBox(height: 2),

                              Text(
                                "Portfolio Allocation",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.greyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 📈 Percentage Badge
                        AnimatedScale(
                          duration: const Duration(milliseconds: 700),
                          scale: startAnimation ? 1 : 0,

                          curve: Curves.easeOutBack,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),

                            decoration: BoxDecoration(
                              color: _getColor(entry.key)
                                  .withOpacity(0.15),

                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: Text(
                              "${entry.value.toInt()}%",

                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: _getColor(entry.key),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 🎨 Coin Colors
  Color _getColor(String key) {
    switch (key.toLowerCase()) {

      case 'btc':
        return const Color(0xFFF7931A);

      case 'eth':
        return const Color(0xFF627EEA);

      case 'sol':
        return const Color(0xFF14F195);

      case 'others':
        return Colors.grey;

      default:
        return Colors.blue;
    }
  }
}