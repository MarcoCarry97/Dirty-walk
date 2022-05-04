import 'package:flutter/material.dart';

class Singleton
{
  static final Singleton _instance=Singleton._internal();

  factory Singleton()=>_instance;

  Singleton._internal();

  AppBar _appBar=AppBar();

  AppBar getAppBar()=>_appBar;

  void setAppBar(AppBar appBar)=>_appBar=appBar;

}