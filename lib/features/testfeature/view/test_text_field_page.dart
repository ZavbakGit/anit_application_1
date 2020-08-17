import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestTextFieldPage extends StatelessWidget {

  final _textEditingController = TextEditingController()
  ..text = 'Новое поколение';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _textEditingController,
              enabled: false,
              cursorColor: Theme.of(context).cursorColor,
              //initialValue: 'Input text',
              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Партнер',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),
                helperText: 'Helper text',
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6200EE)),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}