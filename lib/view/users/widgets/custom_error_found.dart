import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorFound extends StatelessWidget {
  const CustomErrorFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/oops.json'),
            const Text(
              "Something wrong",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
