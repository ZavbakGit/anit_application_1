import 'package:anit_application/features/listprogrammertask/view/list_task_page.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/list_task_programmer_bloc.dart';

class ProgrammerTasksStartFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return BlocProvider(
      create: (context) =>
          ListTasksProgrammerBloc(appModel.user, appModel.loginInfo),
      child: ListTaskPage(),
    );
  }
}
