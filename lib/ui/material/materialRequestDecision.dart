import 'package:flutter/material.dart';

import '../../common_widgets/dropDownBox.dart';
import '../../common_widgets/requestTextField.dart';
import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';

class MaterialRequestDecision extends StatefulWidget {
  const MaterialRequestDecision({super.key});

  @override
  State<MaterialRequestDecision> createState() => _MaterialRequestDecisionState();
}

class _MaterialRequestDecisionState extends State<MaterialRequestDecision> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _chainageController = TextEditingController();
    bool commentvisibility=false;
    return Scaffold(
      appBar: buildAppBar('Request Decision', "Help", () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: topCardUi("Request Decision",
                  "Select your decision to approve or reject request"),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300,width: 2.0),
                    borderRadius: BorderRadius.zero,
                  ),
                 child:ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child:Column(
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
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: Text("")),
                                    Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CommonButton(
                                            text: "Reject",
                                            onPressed: () {

                                                commentvisibility=true;
                                                setState(() {

                                                });
                                              print("Button Clicked!");
                                            },
                                            backgroundColor: Colors.grey.shade100,
                                            textColor: Colors.grey.shade500,
                                            borderRadius: 8.0,
                                            fontSize: 12.0,
                                            padding: 16.0,
                                          ),
                                        ),),
                                    Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CommonButton(
                                            text: "Approve",
                                            onPressed: () {
                                              commentvisibility=false;
                                              setState(() {

                                              });

                                              print("Button Clicked!");
                                            },
                                            backgroundColor: Colors.grey.shade100,
                                            textColor: Colors.grey.shade500,
                                            borderRadius: 8.0,
                                            fontSize: 12.0,
                                            padding: 16.0,
                                          ),
                                        ),),
                                  ],
                                ),
                                Visibility(
                                  visible: true,

                                  child: Container(
                                    color: Colors.grey.shade100,
                                   child:Align(
                                     alignment: Alignment.topLeft,
                                     child: RequestTextField(
                                       qtys:'Reject Reason',
                                       ctlr: _chainageController,
                                       hintname: 'Your Comments',
                                       textfieldheight: 100,
                                     ),
                                   ),
                                  ),
                                )
                              ],
                            )

                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
