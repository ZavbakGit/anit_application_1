import 'dart:convert';
import 'package:anit_application/features/listprogrammertask/model/list_task.dart';
import 'package:anit_application/features/programmertask/programmer_task.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  static const _timeout = 5;

  Map<String, String> _getHeader(String user, String pass) {
    final _auth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': _auth
    };
  }

  Future<ListTask> getTasksUser({User user, LoginInfo loginInfo}) async {
    final _url =
        '${ApiConstants.anitBaseUri}/programmer_tasks?executor=${user.guid}';

    final response = await http
        .get(_url, headers: _getHeader(loginInfo.user, loginInfo.pass))
        .timeout(const Duration(seconds: _timeout));

    if (response.statusCode == 200) {
      final bodyUtf8 = utf8.decode(response.bodyBytes);
      final responseModel = ListTask.fromJson(json.decode(bodyUtf8));
      return responseModel;
    } else {
      throw Exception('Error fetching Tasks programmer');
    }
  }

  Future<User> auth({LoginInfo loginInfo}) async {
    final _url = '${ApiConstants.anitBaseUri}/auth';

    final Response response = await http
        .get(_url, headers: _getHeader(loginInfo.user, loginInfo.pass))
        .timeout(const Duration(seconds: _timeout));

    if (response.statusCode == 200) {
      final bodyUtf8 = utf8.decode(response.bodyBytes);
      final responseModel = User.fromJson(json.decode(bodyUtf8));
      return responseModel;
    } else {
      throw Exception('Error fetching User');
    }
  }

  Future<Task> getProgrammerTask({LoginInfo loginInfo, String guid}) async {
    final _url = '${ApiConstants.anitBaseUri}//programmer_task?guid=${guid}';

    final response = await http
        .get(_url, headers: _getHeader(loginInfo.user, loginInfo.pass))
        .timeout(const Duration(seconds: _timeout));

    if (response.statusCode == 200) {
      final bodyUtf8 = utf8.decode(response.bodyBytes);
      final responseModel = ResponseTask.fromJson(json.decode(bodyUtf8));
      return responseModel.task;
    } else {
      throw Exception('Error fetching Task');
    }
  }
}

class ApiConstants {
  static final anitBaseUri = 'http://172.31.255.150/erp_anit/hs/api_anit';
}
