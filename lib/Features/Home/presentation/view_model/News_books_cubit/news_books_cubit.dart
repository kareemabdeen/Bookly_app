import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        await _homeReposotory.fetchNewestBooks();

    result.fold(
      (handledMessageAsServerErrorObject) {
        emit(NewsBooksFailure(
            errorMessage: handledMessageAsServerErrorObject.toString()));
      },
      (books) {
        emit(NewsBooksSuccess(books: books));
      },
    );
  }
}
