part of 'fetch_similarbooks_cubit.dart';

class FetchSimilarbooksState extends Equatable {
  const FetchSimilarbooksState();

  @override
  List<Object> get props => [];
}

class FetchSimilarbooksInitial extends FetchSimilarbooksState {}

class FetchSimilarbooksSuccesfully extends FetchSimilarbooksState {
  final List<BookModel> books;

  const FetchSimilarbooksSuccesfully({required this.books});
}

class FetchSimilarbooksFailure extends FetchSimilarbooksState {
  final String errorMessage;

  const FetchSimilarbooksFailure({required this.errorMessage});
}

class FetchSimilarbooksLoading extends FetchSimilarbooksState {}
