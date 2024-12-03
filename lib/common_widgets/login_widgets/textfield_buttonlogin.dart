import 'package:flutter/material.dart';

import '../../ui/login/otpScreen.dart';

class TextFieldButton extends StatefulWidget {
  final TextEditingController datactlr;
  final String? buttonname;
  final String label;
  final Function onChange;
  const TextFieldButton({required this.datactlr,this.buttonname,required this.label,required this.onChange});

  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: TextField(
            controller: widget.datactlr,
            onChanged: (v) {
              widget.onChange(v);
            },
            decoration:  InputDecoration(
              border: OutlineInputBorder(),
              hintText: widget.label,
            ),

          ),
        ),
        const SizedBox(height: 5),
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
