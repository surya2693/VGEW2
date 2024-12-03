import 'dart:developer';

import 'package:base_flutter_provider_project/ui/login/otpScreen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/login_widgets/text_image.dart';
import '../../common_widgets/login_widgets/textfield_buttonlogin.dart';


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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: TextFieldImage(
                    title: 'Verification',
                    subtitle:
                        'We will send your One Time Password on your phone number',
                    image: 'assets/images/loginVerification.jpg'),
              ),
              const SizedBox(height: 50),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                  },
                  child: TextFieldButton(
                    datactlr: phoneNumberController,
                    //buttonname: 'GET OTP',
                    label: 'Enter Phone Number',
                    onChange: (v){

                    },

                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
