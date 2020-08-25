import 'package:anit_application/features/catalog/model/manager_catalog.dart';

class Catalog{
  final String type;
  ManagerCatalog _managerCatalog;

  Catalog(this.type){
    _managerCatalog = ManagerCatalog(type: type);
  }


}