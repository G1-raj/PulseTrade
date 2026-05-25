import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/app_button/app_button.dart';
import 'package:pulsetrade/core/widgets/otp_field/otp_field.dart';

class ForgotPasswordOtpVerificationScreen extends StatefulWidget {
  final String email;
  const ForgotPasswordOtpVerificationScreen({super.key, required this.email});

  @override
  State<ForgotPasswordOtpVerificationScreen> createState() => _ForgotPasswordOtpVerificationScreenState();
}

class _ForgotPasswordOtpVerificationScreenState extends State<ForgotPasswordOtpVerificationScreen> {


  String checkOtp = "";
  bool isTimeCompleted = false;
  int secondsLeft = 120;
  Timer? timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    secondsLeft = 120;
    isTimeCompleted = false;

    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        setState(() {
          isTimeCompleted = true;
        });
        timer.cancel();
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              const SizedBox(height: 15,),
        
              CircleAvatar(
                radius: width * 0.2,
                backgroundImage: AppConstant.appLogo
              ),
        
              const SizedBox(height: 30,),
        
              _banner(width, height, widget.email),
        
              const SizedBox(
                height: 50,
              ),

              OtpField(
                onChanged: (otp) {
                  setState(() {
                    checkOtp = otp;
                  });
                }, 
                width: width
              ),

              const SizedBox(height: 20,),

              GestureDetector(
                onTap: isTimeCompleted
                    ? () {
                        startTimer();
                      }
                    : null,
                child: resendMailButton(
                  width,
                  height,
                  isTimeCompleted,
                  secondsLeft,
                ),
              ),
        
      
        
              Spacer(),
        
              //Button
              AppButton(
                width: width,
                height: height,
                onPress: () {},
              ),
        
              const SizedBox(height: 18,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner(double screenWidth, double screenHeight, String email) {
    return Column(
      children: [
        Text(
          "Please enter the code",
          style: TextStyle(
            color: AppTheme.buttonTextColor,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.08,
          ),
        ),

        SizedBox(
          width: screenWidth * 0.85,
          child: Text(
            "We sent an email to $email",
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: AppColors.darkThemePrimaryColor,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.02),

        Icon(Icons.mail, size: 50, color: AppTheme.greyTextColor),
      ],
    );
  }

   Widget resendMailButton(
    double screenWidth,
    double screenHeight,
    bool isTimeCompleted,
    int secondsLeft,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't get a mail?",
          style: TextStyle(
            color: AppTheme.greyTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(width: screenWidth * 0.01),

        Text(
          isTimeCompleted ? "send again" : "retry in $secondsLeft seconds",
          style: TextStyle(
            color: isTimeCompleted ? AppTheme.buttonTextColor : AppTheme.mainButtonColor,
          ),
        ),
      ],
    );
  }
}