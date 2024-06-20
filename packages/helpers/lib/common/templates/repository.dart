import 'package:helpers/parts/api/models/http_service.dart';

abstract class Repository {
  Repository({required this.httpService});

  final HttpService httpService;
}
