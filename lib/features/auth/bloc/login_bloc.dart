import 'package:anit_application/features/auth/bloc/login_event.dart';
import 'package:anit_application/features/auth/bloc/login_state.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AppModel appModel;
  final LoginRepository _loginRepository = LoginRepository();

  LoginBloc({@required this.appModel}): assert(appModel != null),
        super(InitialState());


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print(event);
    if (event is LoadSettingsEvent) {
      //
      yield LoadSettingsState(message: 'Loading settings');
      final loginInfo =  await _loginRepository.getLoginFromSettings();
      yield LoadSettingsSuccessState(loginInfo);
    }else if (event is StartLoginEvent){
      yield LoginInProgressState();
       Future.delayed(Duration(milliseconds: 3000));
      yield LoginFailState(event.loginInfo,'');
    }else{
      throw Exception('Unknown event');
    }
  }
}