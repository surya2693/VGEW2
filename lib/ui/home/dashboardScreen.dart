import 'package:flutter/material.dart';

import 'appDrawer.dart';


class DashboardScreen  extends StatelessWidget {
  const DashboardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engineering Works'),
      ),
      drawer: AppDrawer(), // Left-side menu (drawer)

    );
  }
}
