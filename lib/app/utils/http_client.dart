import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'exceptions.dart';

class HttpNetworkUtil {
  // Setup a singleton
  static final HttpNetworkUtil _httpClient = HttpNetworkUtil._internal();
  factory HttpNetworkUtil() {
    return _httpClient;
  }
  HttpNetworkUtil._internal();

  // global variables
  Logger _logger = Logger();
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie",
      contentType: 'application/json',
      connectTimeout: 200 * 1000,
      receiveTimeout: 200 * 1000,
      followRedirects: true,
    ),
  );

  // methods
  Future<Response> getRequest(String endpoint) async {
    try {
      Response response = await addInterceptors().get(
        endpoint,
      );
      _logger.i(
          "getRequest:\nurl:${response.realUri.toString()}\nresponse:${response.statusCode}");
      return response;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout ||
          ex.type == DioErrorType.receiveTimeout ||
          ex.type == DioErrorType.cancel ||
          ex.type == DioErrorType.sendTimeout) {
        throw DioHttpException();
      }
      return null;
    } catch (e) {
      _logger.e(e);
      throw e;
    }
  }

  Future<Response> postRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    _logger.d(endpoint + "\n" + json.encode(body));
    try {
      Response response = await addInterceptors().post(
        endpoint,
        data: json.encode(body),
      );
      _logger.i(
        "postRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}\n${response.data}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      throw e;
    }
  }

  Future<Response> putRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    _logger.d(json.encode(body));
    try {
      Response response = await addInterceptors().put(
        endpoint,
        data: json.encode(body),
      );
      _logger.i(
        "putRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}\n${response.data}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      throw e;
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      Response response = await addInterceptors().delete(
        endpoint,
      );
      _logger.i(
        "deleteRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      throw e;
    }
  }

  Dio addInterceptors() {
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
    //   HttpClient client,
    // ) {
    //   client.badCertificateCallback = (
    //     X509Certificate cert,
    //     String host,
    //     int port,
    //   ) {
    //     return true;
    //   };
    //   return client;
    // };

    return dio;
  }
}
