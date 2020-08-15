import 'package:anit_application/features/programmertask/model/task.dart';
import 'package:equatable/equatable.dart';

abstract class ProgrammerTaskState extends Equatable {
  const ProgrammerTaskState();
  @override
  List<Object> get props => [];
}

class InitialState extends ProgrammerTaskState {
  @override
  List<Object> get props =>[];
}


class LoadInProgressState extends ProgrammerTaskState {}

class LoadFailState extends ProgrammerTaskState {
  final String message;

  LoadFailState(this.message);

  @override
  List<Object> get props =>[message];
}


class LoadSuccessState extends ProgrammerTaskState {
  final Task task;
  LoadSuccessState(this.task);
  @override
  List<Object> get props =>[task];
}



