import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pc_task/controller/user_details/users_details_controller.dart';
import 'package:pc_task/view/users/widgets/custom_error_found.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late UsersDetailsController usersDetailsController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersDetailsController = UsersDetailsController(context);
  }

  @override
  Widget build(BuildContext context) {
    usersDetailsController.getArgumentFromScreen();

    return Scaffold(
      body: usersDetailsController.usersInfoModel == null
          ? const CustomErrorFound()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CachedNetworkImage(
                    imageUrl:
                        "${usersDetailsController.usersInfoModel!.avatar}",
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                      radius: 100,
                    ),
                    placeholder: (context, url) => const SizedBox(
                        width: 80, child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Id : ${usersDetailsController.usersInfoModel!.id}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Name : ${usersDetailsController.usersInfoModel!.firstName} "
                          "${usersDetailsController.usersInfoModel!.lastName}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email : ${usersDetailsController.usersInfoModel!.email} ",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
