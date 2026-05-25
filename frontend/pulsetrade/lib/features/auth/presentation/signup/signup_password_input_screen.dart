import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/app_button/app_button.dart';
import 'package:pulsetrade/core/widgets/input_field/input_field.dart';

class SignupPasswordInputScreen extends StatelessWidget {
  SignupPasswordInputScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfPassWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
          
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hey👋",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(height: 4,),
          
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create a password",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                  height: 50,
                ),
          
                InputField(
                  width: width,
                  height: height,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  textController: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please provide the password";
                    }

                    if (value.length < 6 || value.length > 12) {
                      return "Password length must between 6 to 12 characters";
                    }

                    final hasUpper = RegExp(r'[A-Z]');
                    final hasLower = RegExp(r'[a-z]');
                    final hasDigit = RegExp(r'[0-9]');
                    final hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

                    if (!hasUpper.hasMatch(value)) {
                      return "Must contain at least one capital letter";
                    }

                    if (!hasLower.hasMatch(value)) {
                      return "Must contain at least one small letter";
                    }

                    if (!hasDigit.hasMatch(value)) {
                      return "Must contain at least one number";
                    }

                    if (!hasSpecial.hasMatch(value)) {
                      return "Must contain at least one special character";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.06),
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),

                InputField(
                  width: width,
                  height: height,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  textController: _cnfPassWordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please provide the password";
                    }

                    if (_passwordController.text !=
                        _cnfPassWordController.text) {
                      return "Password and Confirmation password should be same";
                    }

                    return null;
                  },
                ),
          
                Spacer(),
          
                //Button
                AppButton(
                  width: width,
                  height: height,
                  onPress: () {},
                  buttonText: "Create Account",
                ),
          
                const SizedBox(height: 18,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}