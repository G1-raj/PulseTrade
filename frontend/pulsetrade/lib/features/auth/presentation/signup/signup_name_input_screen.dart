import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';
import 'package:pulsetrade/core/widgets/app_button/app_button.dart';
import 'package:pulsetrade/core/widgets/input_field/input_field.dart';

class SignupNameInputScreen extends StatelessWidget {
  SignupNameInputScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

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
                      "What should we call you?",
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
                  hintText: "Full Name",
                  prefixIcon: Icons.person,
                  textController: _nameController,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Please provide your full name";
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



