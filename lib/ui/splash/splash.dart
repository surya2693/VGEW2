import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_provider_project/common_widgets/alert_widgets/permission_prompt.dart';
import 'package:base_flutter_provider_project/common_widgets/brand_logo.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:base_flutter_provider_project/routes/router_pages.gr.dart';
import 'package:base_flutter_provider_project/ui/login/loginScreen.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (Constant.isPermissionGranted) {
      navigateToNextPage(context);
    } else {
      //Calling API after UI renders
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        permissionPrompt(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Logger.appLogs("Splash: Splash screen");
    return WillPopScope(
      onWillPop: willPopCallback,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ThemeColor.whiteColor,
          child: brandLogo(),
        ),
      ),
    );
  }

  navigateToNextPage(BuildContext contextt) {
    Logger.appLogs('isBoarding:: ${Constant.isBoarding}');
    Logger.appLogs('isLoggedIn:: ${Constant.isLoggedIn}');
    Logger.appLogs('isGranted:: ${Constant.isPermissionGranted}');
Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    /****************Validating Login Session and onBoard Session**************/
    /* if (Constant.isBoarding) {
      _timer = Timer(const Duration(seconds: 3), () {
        if (Constant.isLoggedIn) {
          context.router.replace(const DashBoardRoute());
        } else {
          context.router.replace(const LoginRoute());
        }
      });
    } else {
      context.router.replace(const OnBoardingRoute());
    }*/
    /********************************END***************************************/
    //context.router.replace(const HomeRoute());

  }

  //To request permission
  Future<bool> requestPermission() async {
    Constant.isPermissionGranted = await checkPermission();
    navigateToNextPage(context);
    return Constant.isPermissionGranted;
  }

  void permissionPrompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return PermissionPrompt(
            tapYes: () {
              Navigator.pop(context);
              requestPermission();
            },
            tapCancel: () {
              Navigator.pop(context);
              navigateToNextPage(context);
            },
          );
        });
  }
}
