import 'package:anit_application/features/programmertask/programmer_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgrammerTaskBloc
    extends Bloc<ProgrammerTaskEvent, ProgrammerTaskState> {
  final ProgrammerTaskRepository _repository;
  final String _guid;

  ProgrammerTaskBloc(this._guid, _loginInfo, {child})
      : assert(_guid != null || _loginInfo != null),
        this._repository = ProgrammerTaskRepository(loginInfo: _loginInfo),
        super(InitialState());

  @override
  Stream<ProgrammerTaskState> mapEventToState(
      ProgrammerTaskEvent event) async* {
    print(event);

    if (event is LoadTaskEvent) {
      yield LoadInProgressState();
      try {
        final Task task = await _repository.getTask(_guid);
        yield LoadSuccessState(task);
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
