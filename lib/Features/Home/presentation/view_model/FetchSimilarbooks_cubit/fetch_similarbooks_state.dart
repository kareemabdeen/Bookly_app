part of 'fetch_similarbooks_cubit.dart';

sealed class FetchSimilarbooksState extends Equatable {
  const FetchSimilarbooksState();

  @override
  List<Object> get props => [];
}

final class FetchSimilarbooksInitial extends FetchSimilarbooksState {}

final class FetchSimilarbooksSuccesfully extends FetchSimilarbooksState {
  final List<BookModel> books;

  const FetchSimilarbooksSuccesfully({required this.books});
}

final class FetchSimilarbooksFailure extends FetchSimilarbooksState {
  final String errorMessage;

  const FetchSimilarbooksFailure({required this.errorMessage});
}

final class FetchSimilarbooksLoading extends FetchSimilarbooksState {}
