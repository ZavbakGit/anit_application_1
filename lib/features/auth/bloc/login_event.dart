import 'package:anit_application/model/login_info.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoadSettingsEvent extends LoginEvent {
  const LoadSettingsEvent();
  @override
  List<Object> get props => [];
}

class StartLoginEvent extends LoginEvent {
  final LoginInfo loginInfo;

  StartLoginEvent(this.loginInfo);

  @override
  List<Object> get props => [loginInfo];
}




