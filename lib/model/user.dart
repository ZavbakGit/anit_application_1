class User {
  String name;
  String guid;

  User({this.name, this.guid});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    guid = json['guid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['guid'] = this.guid;
    return data;
  }
}