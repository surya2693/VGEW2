import 'package:flutter/material.dart';


class CommonDropDown extends StatefulWidget {
  final List<String> dropdownItems;
  final String selectedValue;
  final ValueChanged<String?> onDropdownChanged;
  final String dropdownHint;
  const CommonDropDown({super.key,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onDropdownChanged,
    required this.dropdownHint,
  });

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(widget.dropdownHint),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: widget.selectedValue,
          items:  widget.dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged:  widget.onDropdownChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),

          ),
        ),
      ],
    );
  }
}
