import '../models/book_model/book_model.dart';
import '../../../../core/errors.dart';
import 'package:dartz/dartz.dart';

abstract class HomeReposotory {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
