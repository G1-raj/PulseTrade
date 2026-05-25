import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/logout_button/logout_button.dart';
import 'package:pulsetrade/core/widgets/portfolio_card/portfolio_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppTheme.buttonTextColor
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroCard(
                width: width, 
                height: height
              ),

              const SizedBox(
                height: 20,
              ),

              PortfolioCard(
                width: width,
                height: height,
                portfolioValue: 25000,
                todayChange: 12,
              ),

              const SizedBox(height: 20,),

              AccountSection(height: height, width: width),

              const SizedBox(height: 10,),

              SupportSection(width: width, height: height),

              Spacer(),

              LogOutButton(),

              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  final double width;
  final double height;
  const AccountSection(
    {
      super.key,
      required this.height,
      required this.width
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      width: width,
      height: height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Account",
                style: TextStyle(
                  color: AppTheme.greyTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.04
                ),
              ),
            ),
          ),

          const SizedBox(height: 12,),

          ListTile(
            leading: Icon(
              Icons.person, 
              color: Color.fromRGBO(64, 58, 107, 1),
              size: 30,
            ),

            title: Text("Personal Information"),

            trailing: Icon(Icons.arrow_forward_ios),
          ),

          const SizedBox(height: 8,),

          ListTile(
            leading: Icon(
              Icons.shield, 
              color: Color.fromRGBO(45, 80, 63, 1),
              size: 30,
            ),

            title: Text("Security"),

            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}

class SupportSection extends StatelessWidget {
  final double width;
  final double height;
  const SupportSection(
    {
      super.key,
      required this.width,
      required this.height
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      width: width,
      height: height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Support",
                style: TextStyle(
                  color: AppTheme.greyTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.04
                ),
              ),
            ),
          ),

          const SizedBox(height: 12,),

          ListTile(
            leading: Icon(
              Icons.help, 
              color: Color.fromRGBO(44, 65, 111, 1),
              size: 30,
            ),

            title: Text("Help Center"),

            trailing: Icon(Icons.arrow_forward_ios),
          ),

          const SizedBox(height: 8,),

          ListTile(
            leading: Icon(
              Icons.info, 
              color: Color.fromRGBO(69, 56, 103, 1),
              size: 30,
            ),

            title: Text("About PulseTrade"),

            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}





class IntroCard extends StatelessWidget {
  final double width;
  final double height;

  const IntroCard({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.95,
      height: height * 0.12,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [

          // 👤 Profile Image
          Container(
            width: 58,
            height: 58,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(
                color: AppTheme.mainButtonColor.withOpacity(0.4),
                width: 2,
              ),

              image: DecorationImage(
                image: AppConstant.appLogo,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // 👋 User Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // Greeting
                Text(
                  "Welcome back 👋",

                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.greyTextColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Username
                Text(
                  "Govind",

                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.buttonTextColor,
                  ),
                ),
              ],
            ),
          ),

          // 🔔 Notification Button
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14),
            ),

            child: IconButton(
              onPressed: () {},

              icon: Icon(
                Icons.notifications_active_rounded,
                color: AppTheme.greyTextColor,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}