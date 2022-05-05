import 'package:flutter/material.dart';
import 'package:frontend/widgets/components/WalkList.dart';

import '../../classes/Walk.dart';
import '../components/Singleton.dart';

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

  @override
  Widget build(BuildContext context)
  {
    Singleton _single=Singleton();
    _single.setAppBar(_makeAppBar());
    return Scaffold(
      appBar: _single.getAppBar(),
      floatingActionButton: _makeSpeedDial(),
      body: WalkList(_walks),
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
            onTap:(){},
            label: "Map",
            child: Icon(Icons.map,color: Colors.white,)
        )
      ],
    );
  }

}




