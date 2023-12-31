import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.averageRating,
    required this.ratingCount,
  });
  final MainAxisAlignment mainAxisAlignment;

  final num averageRating;
  final num ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 13,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          averageRating.toString(),
          style: StylesManager.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          ratingCount.toString(),
          style: StylesManager.textStyle14.copyWith(
            color: const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
