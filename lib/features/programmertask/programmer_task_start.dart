import 'package:anit_application/features/programmertask/programmer_task.dart';
import 'package:anit_application/features/programmertask/view/programmer_task_page.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProgrammerTaskStartFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    final guid = settings.arguments;

    final appModel = Provider.of<AppModel>(context);

    return BlocProvider(
      create: (context) => ProgrammerTaskBloc(guid, appModel.loginInfo),
      child: ProgrammerTaskPage(),
    );
  }
}
