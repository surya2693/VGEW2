import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/commentTextField.dart';
import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';

class RequestDecision extends StatefulWidget {
  const RequestDecision({super.key});

  @override
  State<RequestDecision> createState() => _RequestDecisionState();
}

class _RequestDecisionState extends State<RequestDecision> {
  bool isChecked =false;
  bool isChecked2 =false;
  final List<String> items = ["M Sand", "Long Steel"];
  final TextEditingController commentController = TextEditingController();

  // Keeps track of the selected checkbox for each row
  List<int?> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    // Initialize with no selection
    selectedOptions = List<int?>.filled(items.length, null);
  }
  @override
  Widget build(BuildContext context) {
    var deviceHeight= MediaQuery.sizeOf(context).height;
    var deviceWidth= MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: buildAppBar("Req#17842","Help",(){}),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topCardUi("Request Decision","Select your decision to approve or reject request"),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: navyBlue,
              height: 60,
              width: deviceWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    // Expanded(
                    //     flex:1,
                    //     child: Text("")),
                    Expanded(
                        flex:1,
                        child: Text("Materials".toUpperCase(),style: TextStyle(color: Colors.white),)),
                    Expanded(
                        flex:1,
                        child: Icon(Icons.check_circle,color: Colors.green,)),
                    Expanded(
                        flex:1,
                        child: Icon(Icons.close,color: Colors.red,)),
                  ],
                ),
              ),
            ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:1,
                    child: Text(
                      items[index],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Checkbox(
                      activeColor: Colors.green,
                      shape: CircleBorder(),
                      value: selectedOptions[index] == 1,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedOptions[index] = value! ? 1 : null;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Checkbox(
                      activeColor: Colors.green,
                      shape: CircleBorder(),
                      value: selectedOptions[index] == 2,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedOptions[index] = value! ? 2 : null;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
            const SizedBox(
              height: 10,
            ),
            topCardUi("Comments","Please utilize this space if you want to convey any specifics."),
            const SizedBox(
              height: 25,
            ),

            CommentTextField(
              title: "Your Message",
              hintText: "Enter your message",
              controller: commentController,
            ),

            const SizedBox(
              height: 12,
            ),
            Row(
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );

  }
}
