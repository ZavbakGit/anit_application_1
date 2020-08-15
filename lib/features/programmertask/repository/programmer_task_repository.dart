import 'package:anit_application/features/programmertask/programmer_task.dart';



class ProgrammerTaskRepository{

  final LoginInfo loginInfo;

  //ToDo Надо внедрять
  final ApiProvider _apiProvider = ApiProvider();

  ProgrammerTaskRepository({this.loginInfo});

  Future<Task> getTask(String guid) async{
    return await _apiProvider.getProgrammerTask(loginInfo: loginInfo,guid: guid);
  }

}