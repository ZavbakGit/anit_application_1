import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoicePage extends StatelessWidget {
  final title;

  const ChoicePage({Key key, @required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title),
            RaisedButton(
              child: Text('Click me'),
              onPressed: (){
                Navigator.pop(context, 'Новое поколение ${DateTime.now()}' );
              },
            )
          ],
        ),
      ),
    );

  }
}