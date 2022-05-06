import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../classes/Walk.dart';

class WalkMap extends StatefulWidget
{
  late List<Walk> _walks;

  WalkMap(List<Walk> walks)
  {
    _walks=walks;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WalkMapState(_walks);
  }

}

class WalkMapState extends State<WalkMap>
{
  late List<Walk> _walks;
  bool _mapLoaded=false;

  WalkMapState(List<Walk> walks)
  {
    _walks=walks;
  }

  Completer<GoogleMapController> _mapController=Completer<GoogleMapController>();
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,);
  @override
  Widget build(BuildContext context)
  {
    var map=GoogleMap(
          initialCameraPosition: _cameraPosition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller)
          {
            _mapController.complete(controller);
            setState(() {
              _mapLoaded=true;
            });
          },
        );
    if(_mapLoaded) return map;
    else return CircularProgressIndicator();
  }

}