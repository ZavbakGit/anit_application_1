import 'package:anit_application/model/task_programmer.dart';

class TasksProgrammer {
  List<Task> tasks;

  TasksProgrammer({this.tasks});

  TasksProgrammer.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = new List<Task>();
      json['tasks'].forEach((v) {
        tasks.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tasks != null) {
      data['tasks'] = this.tasks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}