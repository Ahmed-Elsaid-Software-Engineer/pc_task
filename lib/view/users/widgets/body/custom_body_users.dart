import 'package:flutter/cupertino.dart';
import 'package:pc_task/models/users/response_info_model.dart';
import 'package:pc_task/view/users/widgets/body/custom_not_found_users.dart';
import 'package:pc_task/view/users/widgets/body/custom_users_data.dart';
import 'package:pc_task/view/users/widgets/custom_error_found.dart';

class CustomBodyUsers extends StatelessWidget {
  const CustomBodyUsers({
    super.key,
    required this.snapshot,
    required this.onTapAtItem,
  });

  final AsyncSnapshot<ResponseUsersIModel?> snapshot;
  final Function(UsersInfoModel usersInfoModel) onTapAtItem;

  @override
  Widget build(BuildContext context) {
    return snapshot.connectionState == ConnectionState.waiting
        ? const Center(child: CupertinoActivityIndicator())
        : snapshot.hasError
            ? Text(snapshot.error.toString())
            : snapshot.data == null || !snapshot.hasData
                ? const CustomErrorFound()
                : snapshot.data is UsersInfoModel
                    ? const CustomErrorFound()
                    : snapshot.data!.usersModel == null
                        ? const CustomNotFoundUsers()
                        : snapshot.data!.usersModel!.isEmpty
                            ? const CustomNotFoundUsers()
                            :
                            //?imake this condition beacuse api return while api url not correct return color
                            snapshot.data!.usersModel![0].firstName == null
                                ? const CustomErrorFound()
                                : CustomUsersData(
                                    snapshot: snapshot,
                                    onTapAtItem: onTapAtItem,
                                  );
  }
}
