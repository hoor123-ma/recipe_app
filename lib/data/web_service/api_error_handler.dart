import 'package:breaking_bad_app/data/models/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiErrorHandler {
  final Exception exception;

  ApiErrorHandler({required this.exception});

  ErrorMessageModel getErrorMessage() {
    if (exception is DioException) {
      final dioException = exception as DioException;

      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
          return ErrorMessageModel(
            message: "Connection timeout, please try again.",
            icon: Icons.access_time, // ساعة
          );
        case DioExceptionType.sendTimeout:
          return ErrorMessageModel(
            message: "Send timeout, please try again.",
            icon: Icons.upload, // رفع
          );
        case DioExceptionType.receiveTimeout:
          return ErrorMessageModel(
            message: "Receive timeout, please try again.",
            icon: Icons.download, // تحميل
          );
        case DioExceptionType.badResponse:
          return ErrorMessageModel(
            message:
                "Received invalid status code: ${dioException.response?.statusCode}",
            icon: Icons.error, // خطأ
          );
        case DioExceptionType.cancel:
          return ErrorMessageModel(
            message: "Request was cancelled.",
            icon: Icons.cancel, // إلغاء
          );
        case DioExceptionType.connectionError:
          return ErrorMessageModel(
            message: "Connection error, please check your internet.",
            icon: Icons.wifi_off, // شبكة مقطوعة
          );
        case DioExceptionType.unknown:
        default:
          return ErrorMessageModel(
            message: "Unexpected error occurred.",
            icon: Icons.warning, // تحذير
          );
      }
    } else {
      return ErrorMessageModel(
        message: "Unexpected error: ${exception.toString()}",
        icon: Icons.error_outline, // خطأ عام
      );
    }
  }
}
