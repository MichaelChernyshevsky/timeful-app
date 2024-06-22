import 'package:dio/dio.dart';
import 'package:helpers/common/templates/api.dart';
import 'package:helpers/parts/api/interseptors/interseptors.dart';
import 'package:helpers/parts/api/models/base_response.dart';
import 'package:helpers/parts/api/models/http_exception.dart';
import 'package:helpers/parts/api/models/http_service.dart';

class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService({
    required this.baseUrl,
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions(baseUrl));
    if (enableCaching) {
      dio.interceptors.add(LimitInterceptor(dio: dio));
    }
  }

  final String baseUrl;

  late final Dio dio;

  @override
  Future<BaseResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    final response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }
    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final response = await dio.post(endpoint, queryParameters: queryParameters, data: data);
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> delete(String endpoint, {Map<String, dynamic>? queryParameters, Object? data}) async {
    final response = await dio.delete(endpoint, queryParameters: queryParameters, data: data);

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> patch(String endpoint, {Map<String, dynamic>? queryParameters, Object? data}) async {
    final response = await dio.patch(endpoint, queryParameters: queryParameters, data: data);

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return BaseResponse.fromJson(response.data);
  }
}
