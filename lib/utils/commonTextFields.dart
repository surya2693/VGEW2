import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common_functions.dart';



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final bool? isEnable;
  final TextInputType? txtType;
  final int? maxLength;
  final Icon? preFixIcon;
  final bool? isTxtUpperCase;
  final bool? isRestrictSplChr;
  final FocusNode? focusNode;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.isEnable,
    this.txtType,
    this.maxLength,
    this.preFixIcon,
    this.isTxtUpperCase,
    this.isRestrictSplChr,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(hintText,style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 8,),
        TextFormField(
         // enabled: false,
          focusNode:focusNode,
          textCapitalization: TextCapitalization.characters,
          keyboardType: txtType ?? TextInputType.name,
          enabled: isEnable?? true,
          controller: controller,
          maxLength: maxLength,
          inputFormatters:setUpperCase(isTxtUpperCase,isRestrictSplChr),
        // textCapitalization:
          decoration: InputDecoration(
            hintText: "",
              prefixIcon: preFixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: false,
              border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(10)

              )
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  setUpperCase(bool? isTxtUpperCase, bool? isRestrictSplChr) {

    List<TextInputFormatter> inputFormatters = [];

    if (isTxtUpperCase ?? false) {
      inputFormatters.add(UpperCaseTextFormatter());
      return inputFormatters;
    }

  }
}