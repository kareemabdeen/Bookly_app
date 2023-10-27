part of 'news_books_cubit.dart';

sealed class NewsBooksState extends Equatable {
  const NewsBooksState();

  @override
  List<Object> get props => [];
}

final class NewsBooksInitial extends NewsBooksState {}

final class NewsBooksLoading extends NewsBooksState {}

final class NewsBooksFailure extends NewsBooksState {
  final String errorMessage;

  const NewsBooksFailure({required this.errorMessage});
}

final class NewsBooksSuccess extends NewsBooksState {
  final List<BookModel> books;

  const NewsBooksSuccess({required this.books});
}
