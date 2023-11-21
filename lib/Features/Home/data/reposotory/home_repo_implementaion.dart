import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors.dart';
import '../../../../core/utils/api_services.dart';
import '../models/book_model/book_model.dart';
import 'home_repos.dart';

class HomeRepoImpl implements HomeReposotory {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.getRequest(
          endPoint: "/volumes?Filtering=free-ebooks&q=subject:Programming");

      final List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioExceptions(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.getRequest(
        endPoint:
            "/volumes?Filtering=free-ebooks&orderBy=newest&q=subject:Programming",
      );

      final List<BookModel> books = [];

      // var listOfBooksObjects = data['items'] as List<dynamic>;

      // listOfBooksObjects.map(
      //   (book) {
      //     books.add(BookModel.fromJson(book));
      //   },
      // ).toList;

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioExceptions(e),
        ); // return object of type ServerError
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimillarbooks(
      {required String category}) async {
    try {
      var data = await apiServices.getRequest(
          endPoint:
              "/volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=relevance");

      final List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioExceptions(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
