import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/auth/view/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
      },
      initialRoute: '/',
    );
  }
}
