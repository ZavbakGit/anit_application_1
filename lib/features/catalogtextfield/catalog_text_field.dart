import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogTextField extends StatelessWidget {
  final String type;
  final String title;

  const CatalogTextField({Key key, this.type, this.title}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController()
      ..text = 'Новое поколение';

    return InkWell(
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
      ),

    );
  }

}