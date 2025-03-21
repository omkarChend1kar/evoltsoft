import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:evoltsoft/src/core/utills/network/api_constants.dart'
    show ApiConstants;
// import 'package:vr_trainer/src/core/utill/network/api_constants.dart';

class DioProvider {
  late Dio _dio;

  DioProvider() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (_) => true,
      ),
    );
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () =>
            HttpClient()
              ..badCertificateCallback =
                  (X509Certificate cert, String host, int port) => true;
  }

  Dio get client => _dio;
}
