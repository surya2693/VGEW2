import 'package:base_flutter_provider_project/common_widgets/loading_widgets/loader.dart';
import 'package:base_flutter_provider_project/constants/dimensions.dart';
import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/chatbotlist_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModel/test_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
   _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    //UI render callback
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //Calling api after UI gets rendered successfully
      _homeViewModel.fetchHome(onFailureRes: onFailureRes);
    });
  }

  onFailureRes(String error) {
    Logger.appLogs('onFailureRes:: $error');
    errorAlert(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(

        ),
      )
    );
  }

  Widget _renderBody() {
    return Column(
      children: [
        Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return viewModel.state == ViewState.success
                ? ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.homeResponseModel?.data?.length ?? 0,
              itemBuilder: (context,index){
                return  Card(
                  elevation: 15,

                  child: Container(
                    padding: const EdgeInsets.all(Dimensions.dm_15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.homeResponseModel?.data?[index].firstName ?? Strings.homePage,
                          style: const TextStyle(
                            fontSize: Dimensions.dm_14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text( viewModel.homeResponseModel?.data?[index].email ?? Strings.homePage,
                          style: const TextStyle(
                            fontSize: Dimensions.dm_14,
                            fontWeight: FontWeight.bold,))
                      ],
                    ),
                  ),
                );
              },

                )
                : const SizedBox.shrink();
          },
        ),


      ],
    );
  }
}


/*
Scaffold(
appBar: AppBar(title: Text("Sample Api Provider")),
body: Consumer<ChatBotlistViewModel>(
builder: (context, viewModel, child) {
return viewModel.state == ViewState.busy
? const Loader()
    : _renderBody();
},
),
),*/
