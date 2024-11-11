import 'package:flutter/material.dart';
import 'package:pc_task/models/users/response_info_model.dart';
import 'package:pc_task/view/users/widgets/body/custom_user_detail_item.dart';

class CustomUsersData extends StatelessWidget {
  const CustomUsersData({
    super.key,
    required this.snapshot,
    required this.onTapAtItem,
  });

  final AsyncSnapshot<ResponseUsersIModel?> snapshot;
  final Function(UsersInfoModel usersInfoModel) onTapAtItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: snapshot.data!.usersModel!.length,
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey.withOpacity(.3)),
      itemBuilder: (context, index) => CustomUserDetailItem(
          onTapAtItem: onTapAtItem,
          usersInfoModel: snapshot.data!.usersModel![index]),
    );
  }
}
