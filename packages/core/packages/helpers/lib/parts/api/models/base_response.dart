class BaseResponse {
  final Map<String, dynamic> data;
  final String message;

  factory BaseResponse.fromJson(Map<String, Object?> json) => BaseResponse(data: json['data'] as Map<String, dynamic>, message: json['message'].toString());

  BaseResponse({required this.data, required this.message});
}
