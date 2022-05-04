

import 'package:flutter/foundation.dart';

class Walk
{
  DateTime _date=DateTime(1970);
  String _place="";
  String _description="";

  Walk(String place,DateTime date,String desc)
  {
    _date=date;
    _place=place;
    _description=desc;
  }

  static fromJson(Map<String,dynamic> json)
  {
    return Walk(json["place"],
        DateTime(json["date"]),
        json["description"]);
  }

  String getPlace()=>_place;
  String getDescription()=>_description;
  DateTime getDate()=>_date;

  void setPlace(String place)=>_place=place;
  void setDescription(String description)=>_description=description;
  void setDate(DateTime date)=>_date=date;

}