import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../Home/presentation/views/widgets/books_details_section_widgets.dart';
import '../../../../Home/presentation/views/widgets/custom_bookdetails_appbar_widget.dart';
import '../../../../Home/presentation/views/widgets/similar_books_section_widget.dart';
import '../../../data/models/book_model/book_model.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 10,
              bottom: context.screenHight * .042,
              // horizontal: 30.0,
              // vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomBookDetailsAppBar(),
                BooksDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(bookModel: bookModel),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
