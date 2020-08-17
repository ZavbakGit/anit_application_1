import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/auth_start.dart';
import 'features/listprogrammertask/programmer_tasks_start.dart';
import 'features/programmertask/programmer_task_start.dart';
import 'features/testfeature/test_feature_start.dart';
import 'model/app_model.dart';
import 'model/login_info.dart';
import 'model/user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return MaterialApp(
      routes: {
        '/': (context) =>
            AuthStartFeature(successExecutorFeature: (User user, LoginInfo loginInfo) {
              appModel.user = user;
              appModel.loginInfo = loginInfo;
              Navigator.pushReplacementNamed(context, '/programmer_tasks');
            }),
        '/programmer_tasks': (context) => ProgrammerTasksStartFeature(),
        '/programmer_task': (context) => ProgrammerTaskStartFeature(),
        '/test_feature':(context) => TestFeatureStart(),
      },
      //initialRoute: '/',
      initialRoute: '/test_feature',
    );
  }
}
