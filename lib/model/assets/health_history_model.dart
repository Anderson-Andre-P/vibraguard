class HealthHistory {
  String? status;
  String? timestamp;

  HealthHistory({this.status, this.timestamp});

  factory HealthHistory.fromJson(Map<String, dynamic> json) {
    return HealthHistory(
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }

  get id => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['timestamp'] = timestamp;
    return data;
  }
}
