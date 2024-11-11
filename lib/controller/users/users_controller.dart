import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pc_task/core/database/api/api_data_model.dart';
import 'package:pc_task/core/database/api/api_links.dart';
import 'package:pc_task/core/database/api/handling_data.dart';
import 'package:pc_task/core/database/api/http_consumer.dart';
import 'package:pc_task/core/error/status_request.dart';
import 'package:pc_task/core/resources/const_values.dart';
import 'package:pc_task/core/resources/routes_manager.dart';
import 'package:pc_task/models/users/response_info_model.dart';

class UsersController {
  ResponseUsersIModel? responseUsersModel;
  StatusRequest statusRequestUserInfo = StatusRequest.none;
  int userPageNumber = 1;
  late Stream<ResponseUsersIModel> outPutUsersData;
  late Sink<ResponseUsersIModel> inPutUsersData;
  late StreamController<ResponseUsersIModel> streamControllerUsersData;

  UsersController() {
    startInit();
  }

  void startInit() async {
    await initAllControllers();
    await getAllUserDetails();
  }

  Future<void> initAllControllers() async {
    //?
    streamControllerUsersData = StreamController();
    inPutUsersData = streamControllerUsersData.sink;
    outPutUsersData = streamControllerUsersData.stream;
  }

  void disposeAllControllers() {
    //?
    inPutUsersData.close();
    streamControllerUsersData.close();
  }

  Future<ResponseUsersIModel?> getAllUserDetails() async {
    HttpConsumer httpConsumer = HttpConsumer();
    //?change status to loading while data getting
    statusRequestUserInfo = StatusRequest.loading;
    //?start request
    var dataApi =
        await httpConsumer.get(path: ApiLinks.kUsersEndPoint(userPageNumber));
    dynamic response = dataApi.fold((l) => l, (r) => r);
    //?show is has data or not
    statusRequestUserInfo = await handlingData(response);
    if (statusRequestUserInfo == StatusRequest.hasData) {
      //?it has data success or was message from api
      ApiDataModel apiDataModel = response as ApiDataModel;

      if (apiDataModel.statusRequest >= ConstValues.k400 &&
          apiDataModel.statusRequest <= ConstValues.k499) {
        //? it was message from api you send something wrong
      } else {
        responseUsersModel = ResponseUsersIModel.fromJson(
            apiDataModel.data as Map<String, dynamic>);
        userPageNumber = responseUsersModel!.page!;
        statusRequestUserInfo = StatusRequest.success;
        inPutUsersData.add(responseUsersModel!);
      }
    } else {
      //? was serverFailure or failure from api
    }

    return responseUsersModel;
  }

  void onTapAtItemUser(UsersInfoModel usersInfoModel, BuildContext context) {
    Navigator.of(context).pushNamed(
      RoutesName.usersDetailsRouteName,
      arguments: usersInfoModel,
    );
  }
}
