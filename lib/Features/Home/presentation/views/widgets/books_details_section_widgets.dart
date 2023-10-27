import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../Home/presentation/views/widgets/book_rating_widget.dart';
import '../../../../Home/presentation/views/widgets/custom_book_item.dart';
import '../../../../Home/presentation/views/widgets/custom_button_widget.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * .15,
          ),
          child: const CustomBookImage(),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          'The Jungle Book',
          style: StylesManager.textStyle30.copyWith(
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .85,
          child: Text(
            'Rudyard Kipling',
            style: StylesManager.textStyle18.copyWith(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const Row(
          children: [
            CustomBotton(
              leftborder: true,
              text: '19.99\$',
              textColor: Colors.black,
            ),
            CustomBotton(
              leftborder: false,
              text: 'Free Preview',
              color: Color(0xffFA8B5E),
            ),
          ],
        ),
      ],
    );
  }
}
