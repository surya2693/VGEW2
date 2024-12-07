import 'package:flutter/material.dart';

import '../admin/adminHomePage.dart';
import '../mapScreen/mapScreen.dart';
import '../material/materialRequestReview.dart';
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
            leading:const Icon(Icons.home),
            title:const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },

          ),
          ExpansionTile(title:const Text('Master Setup'),
            leading:const Icon(Icons.admin_panel_settings),
            children: [
              ListTile(
                title:const Text('Units'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),
              ListTile(
                title:const Text('Designation'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),
              ListTile(
                title:const Text('Project Types'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),
              ListTile(
                title:const Text('Employees'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),
              ListTile(
                title:const Text('Equipments'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),
              ListTile(
                title:const Text('Material'),
                onTap: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>MaterialRequestRievew()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage(role: "",)));
                },

              ),
              ListTile(
                title:const Text('Color Codes'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },

              ),

            ],
          ),
          ExpansionTile(title:const Text('Transactions'),
            leading:const Icon(Icons.business),
            children: [
              ListTile(
                title:const Text('Project Creation'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title:const Text('Project Jobs'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title:const Text('Job Current Status'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title:const Text('Project Material'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('Project Equipments'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),

          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Maps'),
            onTap: () {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapPage(lane: "left",)));

            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Admin'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage(role: "admin",)));
              },
          ),
          ExpansionTile(title: const Text('Settings'),leading: const Icon(Icons.settings),
            children: [
              ListTile(
                title: const Text('Users'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('Roles'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('EntityInformation'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
