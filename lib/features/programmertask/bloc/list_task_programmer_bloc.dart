import 'package:anit_application/features/programmertask/repository/tasks_programmer_repository.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/tasks_programmer.dart';
import 'package:anit_application/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_tasks_programmer_event.dart';
import 'list_tasks_programmer_state.dart';

class ListTasksProgrammerBloc
    extends Bloc<ListTasksProgrammerEvent, ListTasksProgrammerState> {
  final User _user;
  final LoginInfo _loginInfo;
  final TasksProgrammerRepository _repository;

  ListTasksProgrammerBloc(this._user, this._loginInfo)
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
        final TasksProgrammer tasksProgrammer =
            await _repository.getTasks(_user);
        yield LoadSuccessState(tasksProgrammer.tasks);
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
