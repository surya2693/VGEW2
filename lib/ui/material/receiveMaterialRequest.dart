import 'package:flutter/material.dart';

import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';
import 'materialRequestDecision.dart';

class RecieveMaterialRequest extends StatefulWidget {
  const RecieveMaterialRequest({super.key});

  @override
  State<RecieveMaterialRequest> createState() => _RecieveMaterialRequestState();
}

class _RecieveMaterialRequestState extends State<RecieveMaterialRequest> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: buildAppBar('Request Materials', "Help", () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: topCardUi("Material Request",
                    "Please look at the material and take further actions."),
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('PROJECT NAME',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 14)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('02/NC/11352/2023-24',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('CHAINAGE',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 14)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('500 mts - 1500 mts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.zero, // Optional: Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Site Engineer',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 14)),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20, // Circle diameter
                            height: 20, // Circle diameter
                            decoration: const BoxDecoration(
                              color: Colors
                                  .orange, // Background color of the circle
                              shape: BoxShape
                                  .circle, // Makes the container circular
                            ),
                            child: const Center(
                              child: Text(
                                'C', // Text to display
                                style: TextStyle(
                                  fontSize: 10, // Text size
                                  color: Colors.white, // Text color
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('ZZZZ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.zero, // Optional: Rounded corners
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Req.Date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 14)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('14-10-2024',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.zero, // Optional: Rounded corners
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('RWQ.Time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 14)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('06:40 PM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: topCardUi(
                    "Requested Material", "List of required Material"),
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
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: CommonButton(
                        text: "Make Decision",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MaterialRequestDecision()));

                          print("Button Clicked!");
                        },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 8.0,
                        fontSize: 12.0,
                        padding: 16.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
