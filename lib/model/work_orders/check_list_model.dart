class Checklist {
  bool? completed;
  String? task;

  Checklist({this.completed, this.task});

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return Checklist(
      completed: json['completed'],
      task: json['task'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completed'] = completed;
    data['task'] = task;
    return data;
  }
}
