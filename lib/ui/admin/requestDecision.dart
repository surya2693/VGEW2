import 'package:flutter/material.dart';

import '../../utils/commonWidgets.dart';

class RequestDecision extends StatefulWidget {
  const RequestDecision({super.key});

  @override
  State<RequestDecision> createState() => _RequestDecisionState();
}

class _RequestDecisionState extends State<RequestDecision> {
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
          children: [
            topCardUi("Request Decision","Select your decision to approve or reject request"),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    ),
    );

  }
}
