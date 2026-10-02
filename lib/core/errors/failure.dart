import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServiceFailure extends Failure {
  const ServiceFailure({required super.errMessage});

  factory ServiceFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServiceFailure(
          errMessage: 'Connection timeout with API server',
        );

      case DioExceptionType.sendTimeout:
        return const ServiceFailure(
          errMessage: 'Send timeout in connection with API server',
        );

      case DioExceptionType.receiveTimeout:
        return const ServiceFailure(
          errMessage: 'Receive timeout in connection with API server',
        );

      case DioExceptionType.badCertificate:
        return const ServiceFailure(
          errMessage: 'Bad SSL certificate. Security check failed.',
        );

      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServiceFailure(
          errMessage: 'Request to API server was cancelled',
        );

      case DioExceptionType.connectionError:
        return const ServiceFailure(
          errMessage: 'No internet connection or server unreachable',
        );

      case DioExceptionType.transformTimeout:
        return const ServiceFailure(
          errMessage:
              'Data transformation timeout. Payload might be too large.',
        );

      case DioExceptionType.unknown:
      default:
        if (dioException.message?.contains('SocketException') ?? false) {
          return const ServiceFailure(errMessage: 'No Internet Connection');
        }
        return const ServiceFailure(
          errMessage: 'Unexpected error occurred, please try again!',
        );
    }
  }

  factory ServiceFailure.fromResponse(int? statusCode, dynamic response) {
    final String? serverMessage =
        (response is Map && response['message'] != null)
        ? response['message'].toString()
        : null;

    switch (statusCode) {
      case 400:
        return ServiceFailure(
          errMessage: serverMessage ?? 'Bad request, please check your input.',
        );
      case 401:
        return ServiceFailure(
          errMessage: serverMessage ?? 'Unauthorized. Please log in again.',
        );
      case 403:
        return ServiceFailure(
          errMessage: serverMessage ?? "Forbidden. You don't have access.",
        );
      case 404:
        return ServiceFailure(
          errMessage:
              serverMessage ??
              'Your request was not found, please try again later.',
        );
      case 409:
        return ServiceFailure(
          errMessage: serverMessage ?? 'Conflict occurred. Please try again.',
        );
      case 422:
        return ServiceFailure(
          errMessage:
              serverMessage ?? 'Validation failed. Please verify your data.',
        );
      case 429:
        return ServiceFailure(
          errMessage:
              serverMessage ?? 'Too many requests. Please try again later.',
        );
      case 500:
        return const ServiceFailure(
          errMessage: 'Internal server error. Please try again later.',
        );
      case 502:
        return const ServiceFailure(
          errMessage: 'Bad gateway. Invalid response from upstream server.',
        );
      case 503:
        return const ServiceFailure(
          errMessage: 'Service unavailable. Server is under maintenance.',
        );
      default:
        return ServiceFailure(
          errMessage:
              serverMessage ?? 'Opps, there was an error. Please try again!',
        );
    }
  }
}
