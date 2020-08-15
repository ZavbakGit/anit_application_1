import 'item_task.dart';

class ListTask {
  List<ItemTask> tasks;

  ListTask({this.tasks});

  ListTask.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = new List<ItemTask>();
      json['tasks'].forEach((v) {
        tasks.add(new ItemTask.fromJson(v));
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