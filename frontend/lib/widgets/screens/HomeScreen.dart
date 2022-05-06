import 'package:flutter/material.dart';
import 'package:frontend/widgets/components/WalkList.dart';
import 'package:frontend/widgets/components/WalkMap.dart';

import '../../classes/Walk.dart';
import '../../classes/Singleton.dart';

import "package:flutter_speed_dial/flutter_speed_dial.dart";

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()
  {
    return HomeScreenState();
  }



}

class HomeScreenState extends State<HomeScreen>
{
  List<Walk> _walks=[Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),
    Walk("Tortona",DateTime(1970),"1223"),];

  late Widget _screen;
  bool _firstRender=false;

  @override
  Widget build(BuildContext context)
  {
    Singleton _single=Singleton();
    if(_firstRender)
    {
      _single.setAppBar(_makeAppBar());
      //_single.setHomes([WalkList(_walks),WalkMap(_walks)]);
      _screen=WalkList(_walks);//_single.changeHome();
      _firstRender=false;
    }
    else _screen=WalkList(_walks);
    print("ok");
    return Scaffold(
      appBar: _single.getAppBar(),
      floatingActionButton: _makeSpeedDial(),
      body: _screen,
    );
  }

  AppBar _makeAppBar()
  {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text("Dirty Walk"),
      actions: [
        Padding(padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: (){},
            child: Icon(Icons.login,
              color: Colors.green,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder()
            ),
          )
          ,)
      ],
    );
  }

  SpeedDial _makeSpeedDial()
  {
    IconData icon;
    String label;
    var onTap=(){};
    if(_screen is WalkList)
    {
      icon=Icons.map;
      label="Show map";
      onTap=(){
        setState(() {
          _screen=WalkMap(_walks);
        });
      };
    }
    else
    {
      icon=Icons.list;
      label="Show list";
      onTap=(){
        setState(() {
          _screen=WalkMap(_walks);
        });
      };
    }

    return SpeedDial(
      backgroundColor: Colors.green,
      visible: true,
      icon: Icons.more,
      animatedIcon: AnimatedIcons.menu_close,
      curve: Curves.bounceInOut,
      useRotationAnimation: true,
      children: [
        SpeedDialChild(
          backgroundColor: Colors.green,
          onTap:(){},
          label: "Add Walk",
          child: Icon(Icons.add,color: Colors.white,),
        ),
        SpeedDialChild(
            backgroundColor: Colors.green,
            onTap:onTap,
            label: label,
            child: Icon(icon,color: Colors.white,)
        )
      ],
    );
  }

}




