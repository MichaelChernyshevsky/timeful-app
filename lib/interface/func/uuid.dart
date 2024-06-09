import 'package:uuid/uuid.dart';

String getUUID() {
  const uuid = Uuid();
  return uuid.v1();
}
