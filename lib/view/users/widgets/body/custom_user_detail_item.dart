import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pc_task/models/users/response_info_model.dart';

class CustomUserDetailItem extends StatelessWidget {
  const CustomUserDetailItem({super.key, required this.usersInfoModel, required this.onTapAtItem});

  final UsersInfoModel usersInfoModel;
  final Function(UsersInfoModel usersInfoModel) onTapAtItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTapAtItem(usersInfoModel);
      },
      title: Text(
        '${usersInfoModel.firstName} ${usersInfoModel.lastName}',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${usersInfoModel.email}',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      trailing: Text(
        '${usersInfoModel.id}',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: CachedNetworkImage(
        imageUrl: "${usersInfoModel.avatar}",
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 40,
        ),
        placeholder: (context, url) =>
            const SizedBox(width: 80, child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
