import 'package:flutter/material.dart';

class RequestTextField extends StatefulWidget {
  final String? qtys;
  final TextEditingController ctlr;
  final String? hintname;
  final double? textfieldheight;

   RequestTextField({ this.qtys,required this.ctlr,this.hintname,this.textfieldheight});

  @override
  State<RequestTextField> createState() => _RequestTextFieldState();
}

class _RequestTextFieldState extends State<RequestTextField> {
  @override
  Widget build(BuildContext context) {
    return
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              widget.qtys??'', // Label text
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              height: widget.textfieldheight??50,
              child: TextField(
                controller: widget.ctlr,
                onChanged: (v) {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: widget.hintname??'',

                ),
              ),
            ),
          ],
        ),
      );

  }
}
