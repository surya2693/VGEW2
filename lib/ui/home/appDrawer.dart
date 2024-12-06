import 'package:flutter/material.dart';

import '../admin/adminHomePage.dart';
import '../mapScreen/mapScreen.dart';
import 'home_screen.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },

          ),
          ListTile(
            leading: Icon(Icons.phonelink_setup),
            title: Text('Master Setup'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },

          ),
          ListTile(
            leading: Icon(Icons.transcribe),
            title: Text('Transactions'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Maps'),
            onTap: () {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapPage(lane: "left",)));

            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Admin'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
              },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
