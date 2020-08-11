import 'package:anit_application/features/auth/bloc/login_bloc.dart';
import 'package:anit_application/features/auth/bloc/login_event.dart';
import 'package:anit_application/features/auth/bloc/login_state.dart';
import 'package:anit_application/model/app_model.dart';
import 'package:anit_application/model/login_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(appModel: AppModel()),
        child: LoginScreen());
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hi')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Card(
            semanticContainer: true,
            margin: EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    TextFieldWidget(),
                    CircularProgressIndicator()
                  ],
                ),
                ButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return ButtonBar(
        children: <Widget>[
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context)
                  .add(StartLoginEvent(LoginInfo(user: "GG", pass: 'hjhj')));
            },
          )
        ],
      );
    });
  }
}

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is InitialState) {
        BlocProvider.of<LoginBloc>(context).add(LoadSettingsEvent());
        return Text('Init');
      }

      if (state is LoadSettingsEvent) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is LoadSettingsSuccessState || state is LoginFailState) {
        final _passTextFieldController = TextEditingController();
        final _userTextFieldController = TextEditingController();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _passTextFieldController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter User Here',
                    labelText: 'User'),
                autofocus: false,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _userTextFieldController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password Here',
                    labelText: 'Password'),
                autofocus: false,
                obscureText: true,
              ),
            ],
          ),
        );
      }

      if (state is LoginInProgressState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is LoadSettingsState) {
        return Text(state.message);
      }

      return Text('unknown state');
    });
  }
}
