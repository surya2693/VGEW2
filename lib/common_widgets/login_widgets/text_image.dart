import 'package:flutter/material.dart';

class TextFieldImage extends StatefulWidget {
  final String title;
  final String image;

  final String subtitle;
  TextFieldImage({required this.title,required this.subtitle,required this.image});

  @override
  State<TextFieldImage> createState() => _TextFieldImageState();
}

class _TextFieldImageState extends State<TextFieldImage> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 100,
              width:80,
            ),
            const SizedBox(height: 5),
            Text(widget.title,style: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,)),
            const SizedBox(height: 5),
            Text(widget.subtitle,style: const TextStyle(color: Colors.grey,fontSize: 15))
          ],
        ),

      );
  }
}