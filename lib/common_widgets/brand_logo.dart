import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget brandLogo() {
  return Center(
    child: Container(
        height: 260,
        width: 260,
        // color: Colors.yellow,
        child: Image.asset('assets/images/pragicon.png')),
  );
}
