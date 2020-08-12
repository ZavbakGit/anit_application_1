import 'package:anit_application/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<AppModel>.value(value: AppModel(dateCreate: DateTime.now()))
    ],
    child: MyApp(),
  ));
}
