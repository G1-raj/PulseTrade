import 'package:flutter/material.dart';

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