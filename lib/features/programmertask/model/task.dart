class ResponseTask {
  Task task;

  ResponseTask({this.task});

  ResponseTask.fromJson(Map<String, dynamic> json) {
    task = json['programmer_task'] != null
        ? new Task.fromJson(json['programmer_task'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.task != null) {
      data['programmer_task'] = this.task.toJson();
    }
    return data;
  }
}

class Task {
  String guid;
  String number;
  DateTime date;
  String partner;
  String contractor;
  DateTime dateStart;
  String director;
  String executor;
  String status;
  String task;
  String contact;
  String priority;
  DateTime planeDateFinish;
  String comment;
  String technicalTask;
  String inspector;

  Task(
      {this.guid,
        this.number,
        this.date,
        this.partner,
        this.contractor,
        this.dateStart,
        this.director,
        this.executor,
        this.status,
        this.task,
        this.contact,
        this.priority,
        this.planeDateFinish,
        this.comment,
        this.technicalTask,
        this.inspector});

  Task.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    date = DateTime.parse(json['date'] as String);
    number = json['number'];
    partner = json['partner'];
    contractor = json['contractor'];
    dateStart = DateTime.parse(json['date_start'] as String);
    director = json['director'];
    executor = json['executor'];
    status = json['status'];
    task = json['task'];
    contact = json['contact'];
    priority = json['priority'];
    planeDateFinish = DateTime.parse(json['plane_date_finish'] as String);
    comment = json['comment'];
    technicalTask = json['technical_task'];
    inspector = json['inspector'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['number'] = this.number;
    data['date'] = this.date;
    data['partner'] = this.partner;
    data['date_start'] = this.dateStart;
    data['director'] = this.director;
    data['executor'] = this.executor;
    data['status'] = this.status;
    data['task'] = this.task;
    data['contact'] = this.contact;
    data['priority'] = this.priority;
    data['plane_date_finish'] = this.planeDateFinish;
    data['comment'] = this.comment;
    data['technical_task'] = this.technicalTask;
    data['inspector'] = this.inspector;
    return data;
  }
}