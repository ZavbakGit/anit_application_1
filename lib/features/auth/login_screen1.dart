import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(

                child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter User Here',
                      labelText: 'User'),
                  readOnly: true,
                  autofocus: false,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password Here',
                      labelText: 'Password'),
                  autofocus: false,
                  obscureText: true,
                ),
                ButtonAuth1()
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class ButtonAuth1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Click me'),
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}
