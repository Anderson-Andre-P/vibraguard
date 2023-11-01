class Metrics {
  String? lastUptimeAt;
  int? totalCollectsUptime;
  double? totalUptime;

  Metrics({this.lastUptimeAt, this.totalCollectsUptime, this.totalUptime});

  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      lastUptimeAt: json['lastUptimeAt'],
      totalCollectsUptime: json['totalCollectsUptime'],
      totalUptime: json['totalUptime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastUptimeAt'] = lastUptimeAt;
    data['totalCollectsUptime'] = totalCollectsUptime;
    data['totalUptime'] = totalUptime;
    return data;
  }
}
