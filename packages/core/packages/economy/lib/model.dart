import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class EconomyModel {
  EconomyModel({
    required this.id,
    required this.title,
    required this.count,
    required this.income,
    required this.description,
    required this.date,
    required this.userId,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String count;
  @HiveField(3)
  String? description;
  @HiveField(4)
  int date;
  @HiveField(5)
  bool income;
  @HiveField(6)
  String userId;

  factory EconomyModel.fromJson(Map<String, Object?> json) {
    return EconomyModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      count: json['count'].toString(),
      income: json['income'] as bool,
      description: json['description'] as String,
      date: json['date'] as int,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> serialize() {
    return {
      'id': id,
      'userId': userId,
      'income': income,
      'title': title,
      'description': description,
      'date': date,
      'count': count,
    };
  }
}

class EconomyModels {
  final List<EconomyModel> models;

  EconomyModels({required this.models});

  factory EconomyModels.fromJson(Map<String, Object?> json) {
    final List<EconomyModel> models = [];

    for (final elemet in json["data"] as List<dynamic>) {
      if (elemet is Map<String, dynamic>) {
        models.add(EconomyModel.fromJson(elemet as Map<String, Object?>));
      }
    }
    return EconomyModels(models: models);
  }
}
