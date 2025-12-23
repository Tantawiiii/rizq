
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rizq/core/api_service/endpoints.dart';
import 'package:rizq/core/utils/lang_helper.dart';
import 'base_api_service.dart';

class ChildApiService extends BaseApiService {
  Dio? dio;
  ChildApiService() {
    init();
  }

  void init() {

    dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    // Add the interceptor for handling 401 Unauthorized errors
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // TODO: INJECT TOKEN AND MAY ACCEPT LANGUAGE
          // if (CachedHelper.getUserToken().isNotEmpty) {
          //   options.headers['Authorization'] =
          //   'Bearer ${CachedHelper.getUserToken()}';
          // }
          // if (CachedHelper.getLang().isNotEmpty) {
          //   options.headers['Accept-Language'] = CachedHelper.getLang();
          // }
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept'] = "application/json";
          options.headers['Accept-Language'] = LangHelper.apiAcceptLanguageHeader;
          // Do something before the request is sent (if needed)
          return handler.next(options); // Continue with the request
        },
        onResponse: (response, handler) async {
          //TODO: HANDLE SPECIFIC STATUS CODES LIKE 401 (TOKEN EXPIRED)
          // debugPrint('response status code: ${response.statusCode}');
          // if (response.statusCode == 422) {
          //   errorToast(response.data['error']);
          // }
          // //401 returned from backend if password is wrong
          // if (response.requestOptions.path.contains('api/driver/login') &&
          //     response.statusCode == 401) {
          //   errorToast(response.data['error']);
          //   return handler.next(response);
          // }
          //
          // if (response.statusCode == 401) {
          //   // this happen when user is in app but token expired or changed
          //   CachedHelper.clear();
          //   RouteManager.navigateAndPopAll(const LoginScreen());
          //   return;
          // }
          // Do something with the response (if needed)
          return handler.next(response); // Continue with the response
        },
        onError: (DioException error, handler) async {
          // debugPrint('response status code1: ${error.response!.statusCode}');
          //TODO: ERROR WILL BE HANDLED THROUGH REPO (YOU COULD STILL REACT TO 401 CODE BY GOING LOGIN)
          // if (error.response != null && error.response!.statusCode == 422) {
          //   errorToast(error.response!.data['error']);
          // }
          // //401 returned from backend if password is wrong
          // if (error.response != null &&
          //     error.response!.requestOptions.path.contains(
          //       'api/driver/login',
          //     ) &&
          //     error.response?.statusCode == 401) {
          //   if (error.response != null) {
          //     errorToast(error.response!.data['error']);
          //   }
          //   return handler.next(error);
          // }
          //
          // if (error.response != null && error.response?.statusCode == 401) {
          //   // this happen when user is in app but token expired or changed
          //   CachedHelper.clear();
          //   stopTimer();
          //   RouteManager.navigateAndPopAll(const LoginScreen());
          //   return;
          // }
          return handler.next(error); // Continue with the error
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

  }

  @override
  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) async {

    var response = await dio!.get(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future<Response> post(
      String path, {
        dynamic body,
        ProgressCallback? onSendProgress,
      }) async {
    var response = await dio!.post(
      path,
      data: body,
      onSendProgress: onSendProgress,
    );
    return response;
  }

  @override
  Future<Response> put(String path, {dynamic body}) async {
    var response = await dio!.put(path, data: body);
    return response;

  }


  @override
  Future<Response> patch(String path, {dynamic body}) async {
    var response = await dio!.patch(path, data: body);
    return response;
  }

  @override
  Future<Response> delete(String path, {dynamic body}) async {
    var response = await dio!.delete(path, data: body);
    return response;

  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}