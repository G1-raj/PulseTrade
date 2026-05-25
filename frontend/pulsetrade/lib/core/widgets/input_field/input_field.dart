import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetrade/core/theme/theme.dart';

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