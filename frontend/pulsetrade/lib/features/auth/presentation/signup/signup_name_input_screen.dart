import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/constants/constant.dart';
import 'package:pulsetrade/core/theme/theme.dart';

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
                ),
          
                Spacer(),
          
                //Button
                AppButton(
                  width: width,
                  height: height,
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

class InputField extends StatefulWidget {
  final double width;
  final double height;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  const InputField(
    {
      super.key,
      required this.width,
      required this.height,
      required this.hintText,
      required this.prefixIcon,
      this.isPassword = false,
      required this.textController,
      this.validator
    }
  );

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.isPassword;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 0.85,
      height: widget.height * 0.1,
      child: TextFormField(
        controller: widget.textController,
        validator: widget.validator,
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon, color: AppTheme.textButtonColor,),
          suffixIcon: widget.isPassword ? GestureDetector(
            onTap: () {
               setState(() {
                _obscureText = !_obscureText;
              });
            },

            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off
            ),
          ) : null,
          filled: true,
          fillColor: AppTheme.inputFieldColor,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(
            color: AppTheme.textButtonColor
          ),

          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppTheme.inputFieldBorderColor,
            )
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppTheme.inputFieldBorderColor,
            )
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppTheme.inputFieldBorderColor,
            )
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppTheme.inputFieldBorderColor,
            )
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.red,
            )
          )


        ),
      )
    );
  }
}

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  const AppButton(
    {
      super.key,
      required this.width,
      required this.height
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.8,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: () {}, 
        style: ElevatedButton.styleFrom(
          foregroundColor: AppTheme.buttonTextColor,
          backgroundColor: AppTheme.mainButtonColor,
          elevation: 3
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.05
              ),
            ),
    
            const SizedBox(width: 7,), 
            Icon(Icons.arrow_forward_rounded, size: width * 0.05,)
          ],
        )
      ),
    );
  }
}