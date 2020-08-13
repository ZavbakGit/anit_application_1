import 'package:anit_application/model/login_info.dart';
import 'package:equatable/equatable.dart';

abstract class ListTasksProgrammerEvent extends Equatable {
  const ListTasksProgrammerEvent();
  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends ListTasksProgrammerEvent {
  const LoadTasksEvent();
  @override
  List<Object> get props => [];
}








