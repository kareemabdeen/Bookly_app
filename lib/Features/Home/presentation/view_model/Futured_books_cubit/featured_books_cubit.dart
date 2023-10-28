import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../data/reposotory/home_repos.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeReposotory) : super(FeaturedBooksInitial());

  final HomeReposotory _homeReposotory;

  Future<void> fetchFeturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookModel>> result =
        await _homeReposotory.fetchFeaturedBooks();

    result.fold((failure) {
      // Failure here is an object with message inside it , so we can use .toString Method to access string message inside it .
      emit(FeaturedBooksFailure(errorMessage: failure.toString()));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
