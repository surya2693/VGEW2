import 'package:flutter/material.dart';


class DropdownBox extends StatefulWidget {
  final String text;

  const DropdownBox({required this.text});

  @override
  State<DropdownBox> createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String? _selectedProject;

  // A list of fruits for the dropdown menu
  final List<String> _projects = ['Sand', 'Steel', 'Msand', 'Psand'];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              widget.text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              child: DropdownButtonFormField<String>(
                value: _selectedProject,
                hint: const Text('Select a Project'),
                items: _projects.map((project) {
                  return DropdownMenuItem<String>(
                    value: project,
                    child: Text(project),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedProject = newValue; // Update selected value
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey, // Color when the TextField is focused
                       // Border width
                    ),
                  ),

                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a project'; // Validation message
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      );

  }
}
