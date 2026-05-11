import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';

sealed class ErrorModel {
  String message;
  String? statusCode;
  ErrorModel([this.message = "Something wentWrong,try again later", this.statusCode]);

  @override
  String toString() {
    return message;
  }

  static Failure<T> _handelDioError<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure<T>(error: ConnectionError());
      case DioExceptionType.badCertificate:
        return Failure<T>(error: ServerError());
      case DioExceptionType.badResponse:
        print('--->${e.response?.statusCode}');
        if (e.response?.statusCode == 401) {
          return Failure<T>(
            error: GeneralError(e.response?.data['message'] ?? "Incorrect email or password"),
          );
        }
        return Failure<T>(error: GeneralError(e.response?.data['message'] ?? "bad response"));
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return Failure<T>(error: GeneralError());
    }
  }

  static Failure<T> handelError<T>(dynamic e) {
    if (e is DioException) {
      return _handelDioError<T>(e);
    } else if (e is ErrorModel) {
      return Failure<T>(error: e);
    } else if (e is String) {
      return Failure<T>(error: GeneralError(e));
    } else if (e is TypeError) {
      return Failure<T>(error: GeneralError("Type error $e"));
    } else {
      print('-->${e.runtimeType}');

      return Failure<T>(error: GeneralError());
    }
  }
}

class GeneralError extends ErrorModel {
  GeneralError([super.message]);
}

class ConnectionError extends ErrorModel {
  ConnectionError() : super("Check you internet connection");
}

class ServerError extends ErrorModel {
  ServerError() : super("Error connecting to the server , try again later");
}

class ParcError extends ErrorModel {
  ParcError() : super("Error Parceing the data");
}
