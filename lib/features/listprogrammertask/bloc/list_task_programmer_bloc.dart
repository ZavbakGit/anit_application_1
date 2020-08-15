import 'package:anit_application/features/listprogrammertask/model/list_task.dart';
import 'package:anit_application/features/listprogrammertask/repository/tasks_programmer_repository.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_tasks_programmer_event.dart';
import 'list_tasks_programmer_state.dart';

class ListTasksProgrammerBloc
    extends Bloc<ListTasksProgrammerEvent, ListTasksProgrammerState> {
  final User _user;

  final TasksProgrammerRepository _repository;

  ListTasksProgrammerBloc(this._user, _loginInfo)
      : assert(_user != null || _loginInfo != null),
        this._repository = TasksProgrammerRepository(loginInfo: _loginInfo),
        super(InitialState());

  @override
  Stream<ListTasksProgrammerState> mapEventToState(
      ListTasksProgrammerEvent event) async* {
    print(event);

    if (event is LoadTasksEvent) {
      yield LoadInProgressState();
      try {
        final ListTask listTask =
            await _repository.getTasks(_user);
        yield LoadSuccessState(listTask.tasks);
        //yield LoadFailState('Test error!');
      } catch (e) {
        print(e);
        yield LoadFailState(e.toString());
      }
    } else {
      throw Exception('Unknown event');
    }
  }
}
