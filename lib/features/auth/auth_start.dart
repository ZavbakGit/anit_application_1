import 'package:anit_application/features/auth/bloc/login_state.dart';
import 'package:anit_application/features/auth/view/login_page.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:anit_application/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/login_bloc.dart';

class AuthStartFeature extends StatelessWidget {

  final Function(User,LoginInfo) successExecutorFeature;

  const AuthStartFeature({Key key, this.successExecutorFeature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    return BlocProvider(
      create: (context) => LoginBloc(appModel),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state){
          if (state is LoginSuccess){
            successExecutorFeature(state.user,state.loginInfo);
          }
        },
        child: LoginPage(),
      ),
    );
  }
}
