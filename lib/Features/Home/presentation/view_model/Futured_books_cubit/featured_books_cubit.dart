import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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
      emit(FeaturedBooksFailure(errorMessage: failure.toString()));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
