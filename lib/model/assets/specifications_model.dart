class Specifications {
  int? maxTemp;

  Specifications({this.maxTemp});

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
      maxTemp: json['maxTemp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxTemp'] = maxTemp;
    return data;
  }
}
