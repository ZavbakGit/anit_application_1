import 'package:anit_application/model/task_programmer.dart';
import 'package:equatable/equatable.dart';

abstract class ListTasksProgrammerState extends Equatable {
  const ListTasksProgrammerState();
  @override
  List<Object> get props => [];
}

class InitialState extends ListTasksProgrammerState {
  @override
  List<Object> get props =>[];
}


class LoadInProgressState extends ListTasksProgrammerState {}

class LoadFailState extends ListTasksProgrammerState {
  final String message;

  LoadFailState(this.message);

  @override
  List<Object> get props =>[message];
}


class LoadSuccessState extends ListTasksProgrammerState {
  final List<Task> tasks;

  LoadSuccessState(this.tasks);

  @override
  List<Object> get props =>[tasks];
}



