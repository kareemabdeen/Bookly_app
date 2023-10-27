import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../data/reposotory/home_repos.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this._homeReposotory) : super(NewsBooksInitial());

  final HomeReposotory _homeReposotory;

  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());
    Either<Failure, List<BookModel>> result =
        await _homeReposotory.fetchFeaturedBooks();

    result.fold((failure) {
      emit(NewsBooksFailure(errorMessage: failure.toString()));
    }, (books) {
      emit(NewsBooksSuccess(books: books));
    });
  }
}