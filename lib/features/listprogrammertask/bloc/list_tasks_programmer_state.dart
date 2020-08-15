import 'package:anit_application/features/listprogrammertask/model/item_task.dart';
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
  final List<ItemTask> tasks;

  LoadSuccessState(this.tasks);

  @override
  List<Object> get props =>[tasks];
}



