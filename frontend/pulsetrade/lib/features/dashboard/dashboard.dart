import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/balance_card/balance_card.dart';
import 'package:pulsetrade/core/widgets/chart_card/chart_card.dart';
import 'package:pulsetrade/core/widgets/crypto_holding_card/crypto_holding_card.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

    Map<String, double> cryptos = {
      "Btc": 55,
      "Eth": 25,
      "Sol": 15,
      "Others": 5
    };

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
        centerTitle: false,
        title: CircleAvatar(
          backgroundImage: AppConstant.appLogo,
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.notifications_active_rounded, color: AppTheme.greyTextColor,)
            ),
          )
        ],
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Welcome back, Govind",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.buttonTextColor
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                  height: 20,
                ),
          
               BalanceCard(
                width: width,
                height: height,
               ),
          
               const SizedBox(
                height: 20,
               ),
          
               ChartCard(
                cryptos: cryptos, 
                width: width, 
                height: height
              ),
          
              const SizedBox(
                height: 20,
              ),
          
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CryptoHoldingCard(
                    cryptoName: "Bitcoin",
                    symbol: "BTC",
                    currentPrice: 48250.75,
                    investedAmount: 12000,
                    percentageChange: 12.4,
                    color: const Color(0xFFF7931A),
                  ),
                ),
              ) 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

