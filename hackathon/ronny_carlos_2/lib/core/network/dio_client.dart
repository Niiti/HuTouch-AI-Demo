import 'dart:convert';

import 'package:dio/dio.dart';

import 'exceptions.dart';


class DioClient {
  final Dio _dio = Dio();

  Future<Response> postDio({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? header,
    Map<String, dynamic>? rawMap,
  }) async {
    try {
      return await _dio.post(
        url,
        data: rawMap,
        queryParameters: parameters,
        options: Options(method: 'POST', headers: header),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException();
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      } else if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw UnauthorizedException();
          case 404:
            throw NotFoundException();
          default:
            throw ServerException();
        }
      } else {
        throw ServerException();
      }
    }
  }

  Future<Response> getDio({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? header,
    Map<String, dynamic>? rawMap,
  }) async {
    try {
      return await _dio.get(
        url,
        data: jsonEncode(rawMap),
        queryParameters: parameters,
        options: Options(method: 'GET', headers: header),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException();
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      } else if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw UnauthorizedException();
          case 404:
            throw NotFoundException();
          default:
            throw ServerException();
        }
      } else {
        throw ServerException();
      }
    }
  }

  Future<Response> patchDio({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? header,
    Map<String, dynamic>? rawMap,
  }) async {
    try {
      return await _dio.patch(
        url,
        data: jsonEncode(rawMap),
        queryParameters: parameters,
        options: Options(method: 'PATCH', headers: header),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException();
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      } else if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw UnauthorizedException();
          case 404:
            throw NotFoundException();
          default:
            throw ServerException();
        }
      } else {
        throw ServerException();
      }
    }
  }
}
