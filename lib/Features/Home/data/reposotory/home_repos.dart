import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';
import '../models/book_model/book_model.dart';

abstract class HomeReposotory {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimillarbooks(
      {required String category});
}
