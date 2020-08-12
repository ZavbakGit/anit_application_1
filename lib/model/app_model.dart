import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';

class AppModel{
  LoginInfo _loginInfo;
  User _user;
  final DateTime dateCreate;

  AppModel({this.dateCreate});

  LoginInfo get loginInfo => _loginInfo;

  set loginInfo(LoginInfo value) {
    _loginInfo = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}