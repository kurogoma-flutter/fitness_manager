import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
abstract class ApiException with _$ApiException {
  @Implements<Exception>()
  const factory ApiException.requestTimeout() = _RequestTimeout;
  @Implements<Exception>()
  const factory ApiException.responseError() = _ResponseError;
  @Implements<Exception>()
  const factory ApiException.sslVerificationError() = _SslVerificationError;
  @Implements<Exception>()
  const factory ApiException.requestException() = _RequestException;
  @Implements<Exception>()
  const factory ApiException.unexpectedException() = _UnexpectedException;

  factory ApiException.getApiException(exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionTimeout:
          return const ApiException.requestTimeout();
        case DioExceptionType.badResponse:
          return const ApiException.responseError();
        case DioExceptionType.badCertificate:
          return const ApiException.sslVerificationError();
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
          return exception.error is HandshakeException
              ? const ApiException.sslVerificationError()
              : const ApiException.requestException();
      }
    }
    return const ApiException.unexpectedException();
  }
}
