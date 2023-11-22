import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_message_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator_widget.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../view_model/FetchSimilarbooks_cubit/fetch_similarbooks_cubit.dart';
import 'custom_book_item.dart';

class SimilarToSelectedBookListView extends StatelessWidget {
  const SimilarToSelectedBookListView({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarbooksCubit, FetchSimilarbooksState>(
      builder: (context, state) {
        if (state is FetchSimilarbooksSuccesfully) {
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                .133, // height of given container to make it as height of all of listview
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                right: 0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks
                            ?.smallThumbnail ??
                        '',
                  ),
                );
              },
            ),
          );
        } else if (state is FetchSimilarbooksFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
