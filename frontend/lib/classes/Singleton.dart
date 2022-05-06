import 'package:flutter/material.dart';

class Singleton
{
  static final Singleton _instance=Singleton._internal();

  factory Singleton()=>_instance;

  Singleton._internal();

  AppBar _appBar=AppBar();

  AppBar getAppBar()=>_appBar;

  late List<Widget> _homes;
  int _homeIndex=0;

  void setHomes(List<Widget> homes)
  {
    _homes=homes;
  }

  Widget changeHome()
  {
    var home=_homes[_homeIndex];
    _homeIndex=(_homeIndex+1)%_homes.length;
    return home;
  }

  void setAppBar(AppBar appBar)=>_appBar=appBar;

}