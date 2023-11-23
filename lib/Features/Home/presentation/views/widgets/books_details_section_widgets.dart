import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../Home/presentation/views/widgets/book_rating_widget.dart';
import '../../../../Home/presentation/views/widgets/custom_button_widget.dart';
import '../../../data/models/book_model/book_model.dart';
import 'custom_book_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * .15,
          ),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: StylesManager.textStyle30.copyWith(
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .85,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? " ",
            style: StylesManager.textStyle18.copyWith(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          averageRating: bookModel.volumeInfo.averageRating ?? 3.4,
          ratingCount: bookModel.volumeInfo.ratingsCount ?? 250,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          children: [
            const CustomBotton(
              leftborder: true,
              text: '19.99\$',
              textColor: Colors.black,
            ),
            CustomBotton(
              leftborder: false,
              text: showAccordingToBookAvailabilityLink(bookModel),
              color: const Color(0xffFA8B5E),
              onTap: () {
                launchCustomUrl(
                  context: context,
                  pathurl: "amndfma",
                );

                /// generatic function on my app
              },
            ),
          ],
        ),
      ],
    );
  }

  String showAccordingToBookAvailabilityLink(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available";
    } else {
      return "Free Preview";
    }
  }
}
