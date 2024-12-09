import 'package:base_flutter_provider_project/ui/admin/requestDecision.dart';
import 'package:flutter/material.dart';

import '../material/materialRequestReview.dart';
import 'assignSupplier.dart';
import 'materialRequest.dart';


class AdminHomePage extends StatefulWidget {
  final String role;
  const AdminHomePage({super.key,required this.role});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int _currentIndex = 0; // To track the selected tab

  String get _role => widget.role;
  // List of pages for each tab
  final List<Widget> _pages = [
    //AdminMaterialRequest() ,
    RequestDecision(),
    AssignSupplier(),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
  ];


  @override
  void initState() {
    super.initState();
    if(_role == "admin"){
      _pages.insert(0, AdminMaterialRequest());
      setState(() {

      });
    }else{
      _pages.insert(0, MaterialRequestRievew());
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
        ],
        selectedItemColor: Colors.blue, // Color of the selected icon/text
        unselectedItemColor: Colors.grey, // Color of unselected icons/text
        showUnselectedLabels: true, // Show labels for unselected items
        type: BottomNavigationBarType.fixed, // Use fixed or shifting style
      ),
    );
  }
}
