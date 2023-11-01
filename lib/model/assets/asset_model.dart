import 'health_history_model.dart';
import 'metrics_model.dart';
import 'specifications_model.dart';

class Assets {
  List<int>? assignedUserIds;
  int? companyId;
  List<HealthHistory>? healthHistory;
  double? healthscore;
  int? id;
  String? image;
  Metrics? metrics;
  String? model;
  String? name;
  List<String>? sensors;
  Specifications? specifications;
  String? status;
  int? unitId;
  Assets.withId({this.id});

  Assets({
    this.assignedUserIds,
    this.companyId,
    this.healthHistory,
    this.healthscore,
    this.id,
    this.image,
    this.metrics,
    this.model,
    this.name,
    this.sensors,
    this.specifications,
    this.status,
    this.unitId,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
        metrics:
            json['metrics'] != null ? Metrics.fromJson(json['metrics']) : null,
        companyId: json['companyId'],
        // healthscore: json['healthscore'],
        healthscore: json['healthscore'] is int
            ? (json['healthscore'] as int).toDouble()
            : json['healthscore'],
        id: json['id'],
        image: json['image'],
        model: json['model'],
        name: json['name'],
        status: json['status'],
        unitId: json['unitId'],
        sensors: List.castFrom<dynamic, String>(json['sensors']),
        specifications: Specifications.fromJson(json['specifications']),
        assignedUserIds: List.castFrom<dynamic, int>(json['assignedUserIds']),
        healthHistory: List.from(json['healthHistory'])
            .map((e) => HealthHistory.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assignedUserIds'] = assignedUserIds;
    data['companyId'] = companyId;
    if (healthHistory != null) {
      data['healthHistory'] = healthHistory!.map((v) => v.toJson()).toList();
    }
    data['healthscore'] = healthscore;
    data['id'] = id;
    data['image'] = image;
    if (metrics != null) {
      data['metrics'] = metrics!.toJson();
    }
    data['model'] = model;
    data['name'] = name;
    data['sensors'] = sensors;
    data['specifications'] = specifications!.toJson();
    data['status'] = status;
    data['unitId'] = unitId;
    return data;
  }
}
