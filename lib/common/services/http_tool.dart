import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../index.dart';

class MyHttpService extends GetxService {
  static MyHttpService get to => Get.find();

  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();

    final options = BaseOptions(
      baseUrl: Constants.myApiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options);

    _dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
      ),
    ));
    _dio.interceptors.add(RequestInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

class RequestInterceptors extends Interceptor {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    showMessagePopup(
      upperText: 'Error',
      contentText: '${err.error.toString()}\n${err.stackTrace}',
      btnTxt: 'OK',
      onPressed: Get.back,
    );
    handler.next(err);
  }
}
