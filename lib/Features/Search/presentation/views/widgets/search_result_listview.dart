import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 21.0),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 7,
          ),
          // child: BookListViewItem(),
          child: Text("bfnasbfka"),
        );
      },
    );
  }
}
