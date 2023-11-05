// ignore_for_file: unnecessary_null_comparison

import 'package:vibraguard/model/work_orders/check_list_model.dart';

class WorkOrders {
  int? assetId;
  List<int>? assignedUserIds;
  List<Checklist>? checklist;
  String? description;
  int? id;
  String? priority;
  String? status;
  String? title;

  WorkOrders(
      {this.assetId,
      this.assignedUserIds,
      this.checklist,
      this.description,
      this.id,
      this.priority,
      this.status,
      this.title});

  factory WorkOrders.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return WorkOrders();
    }
    return WorkOrders(
      assetId: json['assetId'],
      assignedUserIds: List<int>.from(json['assignedUserIds']),
      description: json['description'],
      id: json['id'],
      priority: json['priority'],
      status: json['status'],
      title: json['title'],
      checklist: (json['checklist'] as List<dynamic>)
          .map((e) => Checklist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetId'] = assetId;
    data['assignedUserIds'] = assignedUserIds;
    if (checklist != null) {
      data['checklist'] = checklist!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['id'] = id;
    data['priority'] = priority;
    data['status'] = status;
    data['title'] = title;
    return data;
  }
}
