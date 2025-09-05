import 'package:dio/dio.dart';

class BaseHttpClient {
  static String authorizationHeader = 'Authorization';
  static String requestApiKey = 'b380db029630f55b0f8808d9ec262ab36fbe95499930b95d8a8ea26275ffc457';
  static const int _connectTimeout = 20000;
  static const int _receiveTimeout = 20000;
  static const int _sendTimeout = 20000;
  static const String baseUrl = 'https://rest.coincap.io/v3';
  static const String bearerKey = 'Bearer';

  static Dio createDioHttpClient() {
    final BaseOptions options = BaseOptions(
        headers: {
          authorizationHeader: '$bearerKey $requestApiKey', // Добавляем префикс Bearer
        },
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: _connectTimeout),
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
        sendTimeout: Duration(milliseconds: _sendTimeout));
    Dio dio = Dio(options);

    dio.interceptors
      ..clear()
      ..add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ))
      ..add(
        InterceptorsWrapper(
            onRequest: (request, handler) async => handler.next(request),
            onError: (e, handler) async {
          /// Log
              handler.next(e);
            }),
      );

    return dio;
  }
}
