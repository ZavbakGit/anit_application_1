import 'package:anit_application/model/login_info.dart';

class LoginRepository{
  Future<LoginInfo> getLoginFromSettings() async{
    await Future.delayed(Duration(milliseconds: 3000));
    return LoginInfo(user: 'Alex',pass: '123');
  }
}