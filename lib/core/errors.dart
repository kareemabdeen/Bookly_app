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
        return ServerError(
            errorMessage:
                "Oops, there was an error . Please try again later ...");

      default:
        return ServerError(
            errorMessage:
                "An unexpected error occurred. Please try again later.");
    }
  }
}


      // case DioExceptionType.response:
      //   if (error.response.statusCode == 404) {
      //     return ServerError(
      //         errorMessage:
      //             "The requested resource was not found on the server.");
      //   } else {
      //     return ServerError(
      //         errorMessage:
      //             "An unexpected error occurred. Please try again later.");
      //   }

      