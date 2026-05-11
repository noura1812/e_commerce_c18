import 'package:e_commerce_c18/core/error/error_model.dart';

sealed class CustomResponse<T> {}

class Success<T> extends CustomResponse<T> {
  final T data;

  Success({required this.data});
}

class Failure<T> extends CustomResponse<T> {
  final ErrorModel error;

  Failure({required this.error});
}
