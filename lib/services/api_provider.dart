import 'dart:convert';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:http/http.dart' as http;

class ApiProvider{

  static const _timeout = 5;

  Map<String,String> _getHeader(String user,String pass){
    final _auth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': _auth
    };
  }
  Future<User> auth({LoginInfo loginInfo}) async {
    final _url =
        '${ApiConstants.anitBaseUri}/auth';

    final response = await http.get(_url, headers: _getHeader(loginInfo.user,loginInfo.pass))
        .timeout(const Duration(seconds: _timeout));

    if (response.statusCode == 200) {
      final bodyUtf8 = utf8.decode(response.bodyBytes);
      final responseModel = User.fromJson(json.decode(bodyUtf8));
      return responseModel;
    } else {
      throw Exception('Error fetching User');
    }
  }

}


class ApiConstants{
  static final anitBaseUri = 'http://172.31.255.150/erp_anit/hs/api_anit';
}