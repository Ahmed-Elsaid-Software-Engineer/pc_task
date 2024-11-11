
import 'package:flutter/material.dart';
import 'package:pc_task/models/users/response_info_model.dart';
 import 'package:pc_task/view/users/widgets/body/custom_page_number.dart';
import 'package:pc_task/view/users/widgets/custom_error_found.dart';

class CustomBottomNavBarUsers extends StatelessWidget {
  const CustomBottomNavBarUsers(
      {super.key,
        required this.snapshot,
        required this.userPageNumber,
        required this.onTapAtNewPage});

  final AsyncSnapshot<ResponseUsersIModel?> snapshot;
  final int userPageNumber;
  final Function(int numberPage) onTapAtNewPage;

  @override
  Widget build(BuildContext context) {
    return snapshot.data == null
        ? const SizedBox()
        : snapshot.data!.usersModel![0].firstName == null
        ? const CustomErrorFound()
        : Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPageNumber(
        onTapAtNewPage: (numberPage) async {
          onTapAtNewPage(numberPage);
        },
        activePage: userPageNumber,
        totalPages: snapshot.data!.totalPages!,
      ),
    );
  }
}

