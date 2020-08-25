import 'package:flutter/cupertino.dart';

class ItemCatalog<T>{
  final String guid;
  final String type;
  final String title;
  final T value;

  ItemCatalog({this.guid, @required this.type, this.title, this.value});
}