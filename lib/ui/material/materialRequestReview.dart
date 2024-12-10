import 'package:flutter/material.dart';

import '../../common_widgets/dropDownBox.dart';
import '../../common_widgets/requestTextField.dart';
import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';
import 'materialRequestDecision.dart';

class MaterialRequestRievew extends StatefulWidget {
  const MaterialRequestRievew({super.key});

  @override
  State<MaterialRequestRievew> createState() => _MaterialRequestRievewState();
}

class _MaterialRequestRievewState extends State<MaterialRequestRievew> {
  TextEditingController _chainageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: buildAppBar('Request Materials', "Help", () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: topCardUi("Raise a Request",
                    "Please fill out the form below and let us know what you need."),
              ),
              const DropdownBox(text: 'Project'),
              RequestTextField(
                qtys: 'Chainage',
                ctlr: _chainageController,
                hintname: 'Enter Chainage',
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: topCardUi("Select Materials",
                    "Choose the materials for the project one by one."),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(16.0), // Optional: Rounded corners
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: DropdownBox(text: 'Material'),
                        ),
                        Expanded(
                          flex: 1,
                          child: RequestTextField(
                            qtys: 'Qty',
                            ctlr: _chainageController,
                          ),
                        ),
                      ],
                    ),
                    RequestTextField(
                      qtys: 'Quote from Local Vendor',
                      ctlr: _chainageController,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 150,
                          height: 50,
                          child: CommonButton(
                            text: "Add New",
                            onPressed: () {
                              print("Button Clicked!");
                            },
                            backgroundColor: Colors.lightBlue.shade50,
                            textColor: Colors.blue,
                            borderRadius: 8.0,
                            fontSize: 12.0,
                            padding: 16.0,
                            bordercolor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: topCardUi(
                    "Requested Material", "Overview of the Added Material"),
              ),
              Container(
                color: Colors.black,
                height: 60,
                width: deviceWidth,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("")),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Materials".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text("Cost",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        height: 60,
                        width: deviceWidth,
                        child: const Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text("1"),
                                )),
                            Expanded(flex: 1, child: Text("M Sand")),
                            Expanded(flex: 1, child: Text("10 units")),
                          ],
                        ),
                      ),
                    );
                  }),
              Container(
                color: Colors.grey.shade600,
                height: 60,
                width: deviceWidth,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                          "Total".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ))),
                    const Expanded(
                        flex: 1,
                        child: Text("#####",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: deviceWidth,
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
              const SizedBox(
                height: 10,
              ),
              Container(
                //width: deviceWidth,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
