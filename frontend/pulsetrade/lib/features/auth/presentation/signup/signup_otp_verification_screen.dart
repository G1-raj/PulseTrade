import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/app_button/app_button.dart';

class SignupOtpVerificationScreen extends StatefulWidget {
  final String email;
  const SignupOtpVerificationScreen({super.key, required this.email});

  @override
  State<SignupOtpVerificationScreen> createState() => _SignupOtpVerificationScreenState();
}

class _SignupOtpVerificationScreenState extends State<SignupOtpVerificationScreen> {
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

class OtpField extends StatefulWidget {
  final Function(String) onChanged;
  final double width;
  const OtpField(
    {
      super.key, 
      required this.onChanged,
      required this.width
    }
  );

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {

  final List<TextEditingController> controllers = List.generate(6, (_) =>TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    
    for(final c in controllers) {
      c.dispose();
    }

    for(final f in focusNodes) {
      f.dispose();
    }


    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    final otp = controllers.map((c) => c.text).join();
    widget.onChanged(otp);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
           width: widget.width * 0.12,
           child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

            decoration: InputDecoration(
              counterText: ""
            ),

            onChanged: (value) => _onChanged(index, value),
           ),
        );
      }),
    );
  }
}