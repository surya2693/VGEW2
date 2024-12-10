import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final double padding;
  final Color? bordercolor;
  final bool? isBtnVisible;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.padding = 12.0,
    this.bordercolor=Colors.white,
    this.isBtnVisible
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding * 2),
        side: BorderSide(color:bordercolor??Colors.white ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
              visible: isBtnVisible ?? false,
              child: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,))
        ],
      ),
    );
  }
}
