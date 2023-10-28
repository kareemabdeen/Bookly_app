import 'package:bookly_app/Features/Home/presentation/view_model/News_books_cubit/news_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/presentation/views/widgets/book_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
      builder: (context, state) {
        if (state is NewsBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 21.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewsBooksFailure) {
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
