import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../data/reposotory/home_repos.dart';

part 'fetch_similarbooks_state.dart';

class FetchSimilarbooksCubit extends Cubit<FetchSimilarbooksState> {
  FetchSimilarbooksCubit(this._homeReposotory)
      : super(FetchSimilarbooksInitial());

  final HomeReposotory _homeReposotory;

  Future<void> fetchSimilarBooks() async {
    emit(FetchSimilarbooksLoading());
    Either<Failure, List<BookModel>> result =
        await _homeReposotory.fetchSimillarbooks();

    result.fold(
      (failure) {
        // Failure here is an object with message inside it , so we can use .toString Method to access string message inside it .
        emit(FetchSimilarbooksFailure(errorMessage: failure.toString()));
      },
      (books) {
        emit(FetchSimilarbooksSuccesfully(books: books));
      },
    );
  }
}
