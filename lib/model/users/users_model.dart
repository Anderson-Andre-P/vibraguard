class Users {
  int? companyId;
  String? email;
  int? id;
  String? name;
  int? unitId;

  Users({this.companyId, this.email, this.id, this.name, this.unitId});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      companyId: json['companyId'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
      unitId: json['unitId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyId'] = companyId;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    data['unitId'] = unitId;
    return data;
  }
}
