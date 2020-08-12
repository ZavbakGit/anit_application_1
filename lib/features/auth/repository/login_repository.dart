import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:anit_application/services/api_provider.dart';
import 'package:anit_application/services/sharedreferece_provider.dart';

class LoginRepository{

  final ApiProvider _apiProvider = ApiProvider();

  Future<User> getUser(LoginInfo loginInfo) async{
    return await _apiProvider.auth(loginInfo: loginInfo);
  }


  Future<LoginInfo> getLoginFromSettings() async{
    //await Future.delayed(Duration(milliseconds: 3000));
    final user = await SharedPreferenceProvider.getValue('_user');
    final pass = await SharedPreferenceProvider.getValue('_pass');
    return LoginInfo(user:user,pass: pass);
  }

  Future<bool> setLoginFromSettings(LoginInfo loginInfo) async{
    //await Future.delayed(Duration(milliseconds: 3000));
    final user = await SharedPreferenceProvider.setValue('_user',loginInfo.user);
    final pass = await SharedPreferenceProvider.setValue('_pass',loginInfo.pass);
    return user & pass;
  }

}