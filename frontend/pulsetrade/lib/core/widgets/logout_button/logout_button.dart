import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogOutButton extends StatelessWidget {
  final VoidCallback? onTap;

  const LogOutButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ?? () {},

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),

          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),

            border: Border.all(
              color: Colors.red.withOpacity(0.25),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.logout_rounded,
                color: Colors.red,
                size: 20,
              ),

              const SizedBox(width: 10),

              Text(
                "Log Out",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}