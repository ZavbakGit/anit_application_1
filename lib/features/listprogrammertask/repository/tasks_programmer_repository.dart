import 'package:anit_application/features/listprogrammertask/model/list_task.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:anit_application/services/api_service/api_provider.dart';

class TasksProgrammerRepository{

  final LoginInfo loginInfo;

  //ToDo Надо внедрять
  final ApiProvider _apiProvider = ApiProvider();

  TasksProgrammerRepository({this.loginInfo});

  Future<ListTask> getTasks(User user) async{
    return await _apiProvider.getTasksUser(user:user,loginInfo: loginInfo);
  }


}