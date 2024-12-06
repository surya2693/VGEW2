import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/commonWidgets.dart';
import '../../utils/customButton.dart';

class AdminMaterialRequest extends StatefulWidget {
  const AdminMaterialRequest({super.key});

  @override
  State<AdminMaterialRequest> createState() => _AdminMaterialRequestState();
}

class _AdminMaterialRequestState extends State<AdminMaterialRequest> {
  bool isChecked =false;
  bool isChecked2 =false;


  @override
  Widget build(BuildContext context) {
    var deviceHeight= MediaQuery.sizeOf(context).height;
    var deviceWidth= MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: buildAppBar("Req#17842","Help",(){}),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topCardUi("Material Request","Please look at the material request and take further actions"),
              const SizedBox(
                height: 12,
              ),
              const Text("PROJECT NAME",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 6,
              ),
              Text("02/NC/11352/2023-24",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: navyBlue.withOpacity(0.8)),),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: gridCard("SITE ENGINEER","Bryson M",'B',isChecked,(value){
                      if(value !=null){
                        setState(() {
                          isChecked = value;
                          isChecked2 =false;
                        });
                      }
                    }),),
                  Expanded(
                    flex: 1,
                    child: gridCard("MANAGER","Newton D",'N',isChecked2,(value){
                      if(value !=null){
                        setState(() {
                          isChecked2 = value;
                          isChecked = false;
                        });
                      }
                    }),)
          
          
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              topCardUi("Requested Materials","List of requested materials."),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: navyBlue,
                height: 60,
                width: deviceWidth,
                child: Row(
                  children: [
                    Expanded(
                        flex:1,
                        child: Text("")),
                    Expanded(
                        flex:1,
                        child: Text("Materials".toUpperCase(),style: TextStyle(color: Colors.white),)),
                    Expanded(
                        flex:1,
                        child: Text("QTY",style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    width: deviceWidth,
                    child: const Row(
                      children: [
                     Expanded(
                       flex:1,
                         child: Padding(
                           padding: EdgeInsets.only(left: 8.0),
                           child: Text("1"),
                         )),
                        Expanded(
                            flex:1,
                         child: Text("M Sand")),
                        Expanded(
                            flex:1,
                         child: Text("10 units")),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              topCardUi("Cost Estimate","Approx. cost estimate from site engineer and defined data"),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,

                        width: deviceWidth,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text("#01.M Sand - 10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                SizedBox(width: 6,),
                                Text("units",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.grey)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex:1,
                                    child: costEstimateCard("TENDER","₹ 15000")),
                                Expanded(
                                    flex:1,
                                    child:costEstimateCard("PARTNER","₹ 13500")),
                                Expanded(
                                    flex:1,
                                    child: costEstimateCard("LOCAL","₹ 16250")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                flex:1,
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
              SizedBox(width: 8,),
              Expanded(
                flex:1,
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
      )
    );
  }

   costEstimateCard(String title,String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold)),
        Text(subtitle,style: TextStyle(color: navyBlue),),
      ],
    );
  }

  gridCard(String title,String subtitle,String circleTitle,bool isChecked,Function onClick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Center(
        child: Container(
        width: 20, // Circle diameter
          height: 20, // Circle diameter
          decoration: BoxDecoration(
            color: Colors.orange, // Background color of the circle
            shape: BoxShape.circle, // Makes the container circular
          ),
          child: Center(
            child: Text(
                  circleTitle  , // Text to display
              style: TextStyle(
                fontSize: 10, // Text size
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
          ),
        ),
        ),
            SizedBox(
              width: 8,
            ),
            Text(subtitle,style: TextStyle(color: navyBlue.withOpacity(0.6))),
            SizedBox(
              width: 8,
            ),
            Checkbox(
              shape: CircleBorder(),
              activeColor: Colors.green,
              value: isChecked,
              onChanged: (bool? value) {
                onClick(value);

              },
            )
          ],
        ),
      ],
    );
  }




}
