import 'package:flutter/material.dart';

buildAppBar(String title, String actionTxt, VoidCallback onPress) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      color: Colors.blue,
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // Handle menu button press
      },
    ),
    actions: [
      InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(actionTxt,style: const TextStyle(color: Colors.blue)),
        ),
      )
    ],
  );
}

topCardUi(String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      ),
      SizedBox(
        height: 8,
      ),
      Text(subtitle,
          style: TextStyle(
              fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 14)),
    ],
  );

}


