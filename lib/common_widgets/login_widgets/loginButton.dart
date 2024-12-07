import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String? buttonname;
  final TextEditingController otpctlr;
  const LoginButton({required this.buttonname,required this.otpctlr});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black, // Border color
              width: 1,           // Border width
            ),// Sets the radius of the border
          ),
          child: Center(child: Text(widget.buttonname??'',))
      ),
    ],
    );
  }
}
