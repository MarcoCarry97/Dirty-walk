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
        children: makeWidgetList(_walks)
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

  ListTile makeTile(Walk e)
  {
    return ListTile(
      title: Text(e.getPlace()),
    );
  }
}

