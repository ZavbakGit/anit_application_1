import 'package:anit_application/features/catalogtextfield/ctalog.dart';
import 'dart:math';

class Partner implements Catalog{


  @override
  String getGuid() {
    return 'guid ${Random().nextInt(5)}';
  }

  @override
  String getName() {
    return 'name ${Random().nextInt(5)}';
  }

  @override
  String getType() {
    return 'Справочник.Партнеры';
  }

}