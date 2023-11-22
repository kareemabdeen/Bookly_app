import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_message_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator_widget.dart';
import '../../../../Home/presentation/views/widgets/custom_book_item.dart';
import '../../view_model/Futured_books_cubit/featured_books_cubit.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                .27, // height of given container to make it as height of all of listview
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.kDetailsBookView,
                        arguments: state.books[index],
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks!.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          //loading
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
