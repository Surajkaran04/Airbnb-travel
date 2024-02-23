import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';
import '../preference/preference_manager.dart';
import 'interceptors/logging_interceptor.dart';
import '../app_exception/custom_http_exception.dart';
import '../utils/snackbar.util.dart';
import 'api_constants.dart';

import 'package:get/get.dart' as p_get;

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: 30000, //30 secs
    receiveTimeout: 30000, //30 secs
  ));

  var apiEndPoints = ApiConstants();
  var tag = 'ApiProvider';
  DioError? dioError;

  /// base interceptor
  DioClient.base({remoteBaseUrl, apiToken, type}) {
    _dio.options.baseUrl = remoteBaseUrl ?? apiEndPoints.baseUrl;
    _dio.interceptors.addAll([
      QueuedInterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          options.headers['content-type'] = type == null ? 'application/json' : 'multipart/form-data';
          if (apiToken != null && apiToken != '') {
            if(kDebugMode){
              print('apiToken $apiToken');
            }
            options.headers['Authorization'] = 'Bearer $apiToken';
          }
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          return handler.next(response);
        },
        onError: (DioError dioError, handler) async {
          this.dioError = dioError;
          if (dioError.response != null && (dioError.response!.statusCode == 401 || dioError.response!.statusCode == 403)) {
            PrefManager.remove(AppConstants.userData);
            PrefManager.remove(AppConstants.isLoggedIn);
            SnackBarUtil.showSuccess(
                message: dioError.response!.data != null ? dioError.response!.data!['message'] : 'Your session expired please login again.!');
            // Get.Get.offAllNamed(Routes.login); // session Logout
          } else {
            return handler.next(dioError);
          }
        },
      ),
      LoggerInterceptor(),
    ]);
  }

  /// Get Request
  Future funGetApi({required apiEndPoints, params}) async {
    Response? response;
    try {
      if (params == null) {
        response = await _dio.get(apiEndPoints);
      } else {
        response = await _dio.get(apiEndPoints, queryParameters: params);
      }
    } catch (error) {
      if (error is DioError) {
        catchDioError();
      }
      throw CustomHttpException(message: error.toString(), type: 'unknown');
    }
    return response.data;
  }

  /// Post Request
  Future funPostApi({required apiEndPoints, params}) async {
    Response? response;
    try {
      if (params == null) {
        response = await _dio.post(apiEndPoints);
      } else {
        response = await _dio.post(apiEndPoints, data: params);
      }
    } catch (error) {
      if (error is DioError) {
        catchDioError();
      }
      throw CustomHttpException(message: error.toString(), type: 'unknown');
    }
    return response.data;
  }

  /// error handler
  catchDioError() {
    if (dioError!.type == DioErrorType.other && (dioError!.error is SocketException || dioError!.message.contains('SocketException'))) {
      throw CustomHttpException(message: 'no_internet'.tr, type: 'socketError');
    } else if (dioError!.type == DioErrorType.receiveTimeout || dioError!.type == DioErrorType.connectTimeout) {
      throw CustomHttpException(message: 'connection_timed_out'.tr, type: 'connectionTimeout');
    } else {
      throw CustomHttpException(
        message: dioError!.response!.data['message'] ?? '${'error_occurred_with_code'.tr}: ${dioError!.response!.statusCode}',
        type: dioError!.response!.statusCode.toString(),
      );
    }
  }
}
