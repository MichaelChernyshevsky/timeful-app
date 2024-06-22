import 'package:helpers/parts/api/models/base_response.dart';

abstract class HttpService {
  Future<BaseResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  Future<BaseResponse> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  Future<BaseResponse> patch(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  Future<BaseResponse> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
