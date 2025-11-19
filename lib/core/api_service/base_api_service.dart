import 'package:dio/dio.dart';

abstract class BaseApiService {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> post(String path, {dynamic body, ProgressCallback? onSendProgress,});
  Future<Response> put(String path, {dynamic body});
  Future<Response> patch(String path, {dynamic body});
  Future<Response> delete(String path, {dynamic body});
}