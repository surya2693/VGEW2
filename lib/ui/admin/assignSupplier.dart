import 'package:flutter/material.dart';

import '../../utils/commonDropdown.dart';
import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';
import '../../utils/textfield_dropdown.dart';


class AssignSupplier extends StatefulWidget {
  const AssignSupplier({super.key});

  @override
  State<AssignSupplier> createState() => _AssignSupplierState();
}

class _AssignSupplierState extends State<AssignSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Req#17842","Help",(){}),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topCardUi("Assign Supplier","Assign the supplier for each material"),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey.shade300)
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context,index){
                              return    Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      TextFieldWithDropdown(
                                       textController:  TextEditingController(),
                                        dropdownItems: const ['50', '60', '70'],
                                          selectedValue: '50',
                                        onDropdownChanged: (v){},
                                        hintText: "",
                                        dropdownHint: "Qty (units)",
                                        txtFieldHint: "Material #1",
                                        isEnabled: false,
                                      ),
                                      CommonDropDown(
                                        dropdownItems: const ['Sathish', 'Surya', 'Partner Vendor'],
                                        selectedValue: 'Partner Vendor',
                                        onDropdownChanged: (v){},
                                        dropdownHint: "Select Supplier",
                                      ),
                                      CommonDropDown(
                                        dropdownItems: const ['ABC Enterprises Pvt, Ltd', 'Surya', 'Partner Vendor'],
                                        selectedValue: 'ABC Enterprises Pvt, Ltd',
                                        onDropdownChanged: (v){},
                                        dropdownHint: "Select Partner",
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Divider(
                                        thickness: 0.2,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0, // Add padding from the bottom edge
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CommonButton(
                      text: "Cancel",
                      onPressed: () {
                        print("Button Clicked!");
                      },
                      backgroundColor: Colors.red.shade50,
                      textColor: Colors.red,
                      borderRadius: 8.0,
                      fontSize: 12.0,
                      padding: 16.0,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: CommonButton(
                      text: "Next",
                      onPressed: () {
                        print("Button Clicked!");
                      },
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      borderRadius: 8.0,
                      fontSize: 12.0,
                      padding: 16.0,
                      isBtnVisible: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
