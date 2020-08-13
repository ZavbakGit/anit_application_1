class Task {
  String guid;
  String partner;
  DateTime dateStart;
  String director;
  String executor;
  String status;
  String task;
  String comment;

  Task(
      {this.guid,
        this.partner,
        this.dateStart,
        this.director,
        this.executor,
        this.status,
        this.task,
        this.comment});

  Task.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    partner = json['partner'];
    dateStart = DateTime.parse(json['date_start'] as String);
    director = json['director'];
    executor = json['executor'];
    status = json['status'];
    task = json['task'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['partner'] = this.partner;
    data['date_start'] = this.dateStart;
    data['director'] = this.director;
    data['executor'] = this.executor;
    data['status'] = this.status;
    data['task'] = this.task;
    data['comment'] = this.comment;
    return data;
  }
}