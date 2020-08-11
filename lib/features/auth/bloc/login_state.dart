import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialState extends LoginState {}

class LoadSettingsState extends LoginState {
  final String message;

  LoadSettingsState({this.message});

  @override
  List<Object> get props => [message];
}

class LoginInProgressState extends LoginState {}

class LoadSettingsSuccessState extends LoginState {
  final LoginInfo loginInfo;

  LoadSettingsSuccessState(this.loginInfo);

  @override
  List<Object> get props => [loginInfo];

}

class LoginFailState extends LoginState {
  final LoginInfo loginInfo;
  final String message;

  LoginFailState(this.loginInfo, this.message);

  @override
  List<Object> get props => [loginInfo,message];

}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({this.user});

  @override
  List<Object> get props => [user];
}






