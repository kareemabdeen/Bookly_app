import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage});

  factory ServerError.fromDioExceptions(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badCertificate:
        return ServerError(
          errorMessage:
              "There is a problem with the server's SSL certificate. Please try again later or contact support.",
        );
      case DioExceptionType.connectionTimeout:
        return ServerError(
            errorMessage:
                "Connection to the server timed out. Please check your internet connection and try again.");

      case DioExceptionType.receiveTimeout:
        return ServerError(
            errorMessage:
                "The server is taking too long to respond. Please try again later.");

      case DioExceptionType.sendTimeout:
        return ServerError(
            errorMessage:
                "Sending data to the server timed out. Please check your internet connection and try again.");

      case DioExceptionType.cancel:
        return ServerError(
            errorMessage: "The request was canceled. Please try again.");

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerError(
              errorMessage:
                  'There was connection error , please try again later ...');
        } else {
          return ServerError(
              errorMessage:
                  "An unexpected error occurred. Please try again later.");
        }

      case DioExceptionType.badResponse:
        return ServerError.badReponse(
            statusCode: dioException.response!.statusCode!,
            response: dioException.response!.data);

      default:
        return ServerError(
            errorMessage: "oops there was an error , Please try again later.");
    }
  }

  factory ServerError.badReponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(errorMessage: response.toString());
    } else if (statusCode == 404) {
      return ServerError(errorMessage: 'your request not found');
    } else if (statusCode == 500) {
      return ServerError(errorMessage: 'internal server error');
    } else {
      return ServerError(
          errorMessage:
              "Oops, there was an error . Please try again later ...");
    }
  }
}
