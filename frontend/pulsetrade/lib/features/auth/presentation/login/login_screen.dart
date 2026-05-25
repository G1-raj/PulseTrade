import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/app_button/app_button.dart';
import 'package:pulsetrade/core/widgets/input_field/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

                 Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back!👋",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.bold,
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
                   hintText: "Email", 
                   prefixIcon: Icons.mail, 
                   textController: _emailController
                ),

                const SizedBox(height: 7,),

                 InputField(
                  width: width,
                   height: height, 
                   hintText: "Password", 
                   prefixIcon: Icons.lock, 
                   textController: _passwordController,
                   isPassword: true,
                ),

                TextButton(
                  onPressed: () {}, 
                  child: Text("Forgot password?", style: GoogleFonts.inter(
                    color: AppTheme.buttonTextColor
                  ),)
                ),

                Spacer(),

                 AppButton(
                  width: width,
                  height: height,
                  onPress: () {},
                  buttonText: "Login",
                ),

                const SizedBox(height: 18,)
            ],
          ),
        ),
      ),

    );
  }
}