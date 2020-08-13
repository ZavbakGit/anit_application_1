import 'package:anit_application/features/auth/bloc/login_event.dart';
import 'package:anit_application/features/auth/bloc/login_state.dart';
import 'package:anit_application/features/auth/repository/login_repository.dart';
import 'package:anit_application/model/app_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AppModel _appModel;
  final LoginRepository _loginRepository = LoginRepository();

  LoginBloc(this._appModel) : assert(_appModel != null), super(InitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print(event);
    if (event is LoadSettingsEvent) {
      yield LoadSettingsState(message: 'Loading settings');
      final loginInfo =  await _loginRepository.getLoginFromSettings();
      yield LoadSettingsSuccessState(loginInfo,null);
    }else if (event is StartLoginEvent){
      yield LoginInProgressState();

      await _loginRepository.setLoginFromSettings(event.loginInfo);
      //await Future.delayed(Duration(milliseconds: 5000));

      try {
        final user = await _loginRepository.getUser(event.loginInfo);
        yield LoginSuccess(user,event.loginInfo);
      } catch (e) {
        yield LoadSettingsSuccessState(event.loginInfo,'${e.toString()}');
        print(e);
      }

      //yield LoadSettingsSuccessState(event.loginInfo);
    }else{
      throw Exception('Unknown event');
    }
  }
}