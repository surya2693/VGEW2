import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/commonTextFields.dart';
import '../../utils/common_functions.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController(text: '');
  bool repeat = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const BackButtonLS(),
                  SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Container(
                        height: 260,
                        width: 260,
                        // color: Colors.yellow,
                        child: Image.asset('assets/images/pragicon.png')),
                  ),

                  Text(
                    'Log In To Continue!',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    txtType: TextInputType.number,
                    controller: phoneNumberController,
                    hintText: 'Phone number',
                    maxLength: 10,
                    onChanged: (u) {},
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: commonButton(
                        onTap: () {},
                        btnName: "Submit",
                        btncolors: Colors.green,
                        width: devicewidth),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
