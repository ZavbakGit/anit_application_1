import 'package:anit_application/features/auth/bloc/login_bloc.dart';
import 'package:anit_application/features/auth/bloc/login_event.dart';
import 'package:anit_application/features/auth/bloc/login_state.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appModel = Provider.of<AppModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoadSettingsSuccessState) {
                  if ((state.message??"").isNotEmpty) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                }
              },
              child: LoginScreen()),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is InitialState) {
          BlocProvider.of<LoginBloc>(context).add(LoadSettingsEvent());
          return Text('');
        }

        if (state is LoadSettingsState) {
          return ProgressWidget();
        }

        if (state is LoginInProgressState) {
          return ProgressWidget();
        }

        if (state is LoginSuccess){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                Text('${state.user.name}'),
                RaisedButton(
                  child: Text('Repeat'),
                  onPressed: (){
                    BlocProvider.of<LoginBloc>(context).add(LoadSettingsEvent());
                  },
                )
              ],
            ),
          );
        }

        if (state is LoadSettingsSuccessState) {
          final _passTextFieldController = TextEditingController();
          final _userTextFieldController = TextEditingController();

          _userTextFieldController.text = state.loginInfo.user ?? '';
          _passTextFieldController.text = state.loginInfo.pass ?? '';

          return Card(
            semanticContainer: true,
            margin: EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    controller: _userTextFieldController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter User Here',
                        labelText: 'User'),
                    autofocus: false,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    controller: _passTextFieldController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password Here',
                        labelText: 'Password'),
                    autofocus: false,
                    obscureText: true,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Next'),
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            StartLoginEvent(
                              LoginInfo(
                                  pass: _passTextFieldController.text,
                                  user: _userTextFieldController.text),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }

        return Text('Unknown state');
      },
    );
  }
}

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

