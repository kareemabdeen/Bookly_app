import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../Home/presentation/views/widgets/similar_listview_widget.dart';
import '../../../data/models/book_model/book_model.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: StylesManager.textStyle14.copyWith(
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarToSelectedBookListView(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
