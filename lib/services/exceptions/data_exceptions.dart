import 'package:base_flutter_provider_project/services/exceptions/error_constants.dart';
import 'package:dio/dio.dart';

class DataException implements Exception {
  DataException({required this.message});

  DataException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = LocaleKeys.errorRequestCancelled;
        break;
      case DioExceptionType.connectionTimeout:
        message = LocaleKeys.errorConnectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = LocaleKeys.errorReceiveTimeout;
        break;
      case DioExceptionType.badResponse:
        message = errorResponseHandler(dioError);
        break;
      case DioExceptionType.sendTimeout:
        message = LocaleKeys.errorSendTimeout;
        break;
      case DioExceptionType.unknown:
        message = LocaleKeys.errorSocketException;
        break;
      default:
        message = LocaleKeys.errorInternetConnection;
        break;
    }
  }

  String message = "";

  static String handleError(int statusCode) {
    switch (statusCode) {
      case 403:
        return LocaleKeys.errorForbidden;
      case 401:
        return LocaleKeys.errorSendTimeout;
      case 400:
        return LocaleKeys.errorBadRequest;
      case 404:
        return LocaleKeys.errorRequestNotFound;
      case 500:
        return LocaleKeys.errorInternalServer;
      default:
        return LocaleKeys.errorSomethingWentWrong;
    }
  }

  @override
  String toString() => message;

  static String errorResponseHandler(DioError error) {
    switch (error.response!.statusCode) {
      case 403:
        return LocaleKeys.errorForbidden;
      case 401:
        return LocaleKeys.errorSendTimeout;
      case 400:
        if(error.response!.data!=null) {
          return error.response!.data['error'];
        }
        return LocaleKeys.errorBadRequest;
      case 404:
        return LocaleKeys.errorRequestNotFound;
      case 500:
        if(error.response!.data!=null) {
          return error.response!.data['message'];
        }
        return LocaleKeys.errorInternalServer;
      case 409:
        if(error.response!.data!=null) {
          return error.response!.data['message'];
        }
        return LocaleKeys.errorSomethingWentWrong;
      default:
        return LocaleKeys.errorSomethingWentWrong;
    }
  }
}
