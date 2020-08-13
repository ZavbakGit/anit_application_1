import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/tasks_programmer.dart';
import 'package:anit_application/model/user.dart';
import 'package:anit_application/services/api_provider.dart';
import 'package:anit_application/services/sharedreferece_provider.dart';

class TasksProgrammerRepository{

  final LoginInfo loginInfo;

  //ToDo Надо внедрять
  final ApiProvider _apiProvider = ApiProvider();

  TasksProgrammerRepository({this.loginInfo});

  Future<TasksProgrammer> getTasks(User user) async{
    return await _apiProvider.getTasksUser(user:user,loginInfo: loginInfo);
  }


}