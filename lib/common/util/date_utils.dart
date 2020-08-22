import 'package:intl/intl.dart';

extension DateUtil on DateTime{
  int getDaysPassed(){
    final currentDate = DateTime.now();
    return currentDate.difference(this).inDays;
  }

  String getDaysPassedString(){
    final currentDate = DateTime.now();
    final days =  currentDate.difference(this).inDays;
    return days <=0?"":"${days} д.";
  }

  String getDateFormatDDMMYY(){
    //if (this.millisecondsSinceEpoch)
    return DateFormat('dd.MM.yyyy').format(this);
  }



}