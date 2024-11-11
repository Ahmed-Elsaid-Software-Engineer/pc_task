import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pc_task/controller/users/users_controller.dart';
import 'package:pc_task/models/users/response_info_model.dart';
import 'package:pc_task/view/users/widgets/app_bar/custom_app_bar_users.dart';
import 'package:pc_task/view/users/widgets/body/custom_body_users.dart';
import 'package:pc_task/view/users/widgets/bottom_nav_bar/custom_bottom_nav_bar_users.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersController usersController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersController = UsersController();
  }

  @override
  void dispose() {
    usersController.disposeAllControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponseUsersIModel>(
      stream: usersController.outPutUsersData,
      builder: (context, snapshot) => Scaffold(
          appBar: const CustomAppBarUsers(),
          body: CustomBodyUsers(
            snapshot: snapshot,
            onTapAtItem: (UsersInfoModel usersInfoModel) {
              usersController.onTapAtItemUser(usersInfoModel, context);
            },
          ),
          bottomNavigationBar: CustomBottomNavBarUsers(
            snapshot: snapshot,
            onTapAtNewPage: (int numberPage) async {
              usersController.userPageNumber = numberPage;
              usersController.responseUsersModel =
                  await usersController.getAllUserDetails();
            },
            userPageNumber: usersController.userPageNumber,
          )),
    );
  }
}
