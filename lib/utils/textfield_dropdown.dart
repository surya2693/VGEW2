import 'package:flutter/material.dart';

class TextFieldWithDropdown extends StatelessWidget {
  final TextEditingController textController;
  final List<String> dropdownItems;
  final String selectedValue;
  final ValueChanged<String?> onDropdownChanged;
  final String hintText;
  final String txtFieldHint;
  final String dropdownHint;
  final bool isEnabled;

  const TextFieldWithDropdown({
    Key? key,
    required this.textController,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onDropdownChanged,
    this.hintText = 'Enter text',
    required this.txtFieldHint,
    required this.dropdownHint,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: screenWidth * 0.5,
              child: Text(txtFieldHint,style: TextStyle(color: Colors.grey),)
            ),
            const SizedBox(width: 10),
            Expanded(child:  Text(dropdownHint))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: screenWidth * 0.5,
              child: TextFormField(
                controller: textController,
                enabled: isEnabled,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.brown.shade50,

                  border: OutlineInputBorder(

                  ),
                  labelText: hintText,
                ),
              ),
            ),
            const SizedBox(width: 10), // Add some spacing between widgets
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedValue,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onDropdownChanged,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Qty',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
