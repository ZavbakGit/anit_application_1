import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choice_page.dart';

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
              InkWell(
                onTap: () async  {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoicePage(
                                title: _textEditingController.text,
                              )));

                  if (result != null){
                    _textEditingController.text = result as String;
                  }

                },
                child: TextFormField(
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
//                    suffixIcon: Icon(
//                      Icons.arrow_forward_ios,
//                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
