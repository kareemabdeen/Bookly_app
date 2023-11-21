import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          .133, // height of given container to make it as height of all of listview
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          right: 0,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset('assets/images/download (1).jfif'),
            // CustomBookImage(
            //   imageUrl: 'assets/images/download (1).jfif',
            // ),
          );
        },
      ),
    );
  }
}
