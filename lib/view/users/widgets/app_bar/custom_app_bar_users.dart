import 'package:flutter/material.dart';
import 'package:pc_task/core/resources/const_values.dart';

class CustomAppBarUsers extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          ConstValues.kAllUsersDetails,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
