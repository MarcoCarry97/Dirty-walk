import 'package:flutter/material.dart';

import '../../classes/Walk.dart';

class WalkList extends StatelessWidget
{
  List<Walk> _walks=[];

  WalkList(List<Walk> list)
  {
    _walks=list;
  }

  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return ListView(
        shrinkWrap: true,
        children: makeWidgetList(_walks),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0)
      );
  }

  List<Widget> makeWidgetList(List list)
  {
    List<Widget> widgets=[];
    for(dynamic elem in list)
    {
      widgets.add(makeTile(elem));
    }
    return widgets;
  }

  Card makeTile(Walk e)
  {
    String dateString="${e.getDate().day}/${e.getDate().month}/${e.getDate().year}";
    String timeString="${e.getDate().hour}:${e.getDate().minute}";
    String dtString="$dateString $timeString";
    return Card(
      child: TextButton(
        child: ListTile(
          title: Row(children: [
              Expanded(child: Text("Walk in:")),
              Text(e.getPlace())
            ],
          ),
          subtitle: Row(children: [
              Expanded(child: Text("When:")),
              Text(dtString),
            ],
          ),
        ),
        onPressed: (){
          print("Pressed");
        },
        style: TextButton.styleFrom(
          shadowColor: Colors.green,
          onSurface: Colors.green,
        ),
      ),
    );
  }
}

