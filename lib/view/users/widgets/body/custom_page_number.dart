import 'package:flutter/material.dart';

class CustomPageNumber extends StatelessWidget {
  const CustomPageNumber({
    super.key,
    required this.totalPages,
    required this.activePage,
    required this.onTapAtNewPage,
  });

  final int totalPages;
  final int activePage;
  final Function(int numberPage) onTapAtNewPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Center(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => IconButton.filledTonal(
                onPressed: () {
                  onTapAtNewPage(index + 1);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: activePage == index + 1
                        ? Colors.greenAccent
                        : Colors.grey.withOpacity(.4)),
                icon: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                      color: activePage == index + 1
                          ? Colors.black
                          : Colors.white),
                )),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: totalPages),
      ),
    );
  }
}
