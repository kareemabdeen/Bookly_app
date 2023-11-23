part of 'news_books_cubit.dart';

class NewsBooksState extends Equatable {
  const NewsBooksState();

  @override
  List<Object> get props => [];
}

class NewsBooksInitial extends NewsBooksState {}

class NewsBooksLoading extends NewsBooksState {}

class NewsBooksFailure extends NewsBooksState {
  final String errorMessage;

  const NewsBooksFailure({required this.errorMessage});
}

class NewsBooksSuccess extends NewsBooksState {
  final List<BookModel> books;

  const NewsBooksSuccess({required this.books});
}
