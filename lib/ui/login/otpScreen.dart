import 'dart:developer';

import 'package:base_flutter_provider_project/ui/login/splashScreen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/login_widgets/loginButton.dart';
import '../../common_widgets/login_widgets/text_image.dart';
import '../../common_widgets/login_widgets/textfield_buttonlogin.dart';
import '../../packages/otpPinPut.dart';
import '../../utils/commonTextFields.dart';
import '../../utils/common_functions.dart';
import '../dxf/dxfPage.dart';
import '../home/home_screen.dart';
import '../mapScreen/mapScreen.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController(text: '');

  bool repeat = false;

  @override
  Widget build(BuildContext context) {
    String otp = '';
    var devicewidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Center(
                  child: TextFieldImage(
                      title: 'Verification',
                      subtitle: 'You will get a OTP via SMS',
                      image: 'assets/images/loginotp.jpg'),
                ),
                const SizedBox(height: 50),
                const Center(
                  child: otpPinPut(),
                ),
                const SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()));
                    },
                    child: LoginButton(
                      otpctlr: otpController,
                      buttonname: 'VERIFY',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text('Didnt receive code?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text('Resend again',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
