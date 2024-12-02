import 'package:base_flutter_provider_project/app.dart';
import 'package:base_flutter_provider_project/config/locator.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
   Hive.init(appDocumentDir.path);

  // Initialize the box for markers
 box= await Hive.openBox('markers');
  //To setup the singleton initialization
  setupLocator();

  //Check for onBoarding
  //Constant.isBoarding = await checkOnBoarding();
  //Check for onLogin
  //Constant.isLoggedIn = await checkIsLoggedIn();
  //Check for permission
  Constant.isPermissionGranted = await validatePermission();

  Logger.appLogs('runApp ${Constant.isBoarding}:: ${Constant.isLoggedIn}');

  runApp(const MyApp());
}
