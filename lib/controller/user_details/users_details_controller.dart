import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pc_task/core/resources/const_values.dart';
import 'package:pc_task/models/users/response_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersDetailsController {
  BuildContext context;

  UsersDetailsController(this.context) ;

  UsersInfoModel? usersInfoModel;

  void getArgumentFromScreen() async {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is UsersInfoModel) {
      usersInfoModel = arguments;
      //?store in   SharedPreferences because loading delete data
      saveUser(usersInfoModel!);
    } else {
      await getUser();
    }
  }

  Future<void> saveUser(UsersInfoModel user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(ConstValues.kUser, userJson);
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? userJson = prefs.getString(ConstValues.kUser);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      usersInfoModel = UsersInfoModel.fromJson(userMap);
    }
  }
}
