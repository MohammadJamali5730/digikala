import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart';

class Mymapview extends StatefulWidget {
  const Mymapview({super.key});
  @override
  State<Mymapview> createState() => _MymapviewState();
}

class _MymapviewState extends State<Mymapview> {
  late MapController mapController;
  Location location = Location();
  LocationData? locationData;
  @override
  void initState() {
    super.initState();
    initOSM();
    getlocation();
  }

  Future initOSM() async {
    mapController = MapController(
        initPosition: GeoPoint(latitude: 37.0826373, longitude: -94.4858617));
  }

  Future getlocation() async {
    final permission = await location.hasPermission();
    if (permission == PermissionStatus.granted) {
      locationData = await location.getLocation();
    } else {
      await location.requestPermission();
      locationData = await location.getLocation();
    }
    setState(() {});
    GeoPoint myaddress = GeoPoint(
        latitude: locationData!.latitude!, longitude: locationData!.longitude!);
    // ignore: deprecated_member_use
    await mapController.goToLocation(myaddress);
    await mapController.addMarker(myaddress,
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.pin_drop_outlined,size: 40,color:Colors.red ,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Your Location'),centerTitle: true,),
      body: OSMFlutter(
          controller: mapController,
          osmOption: const OSMOption(zoomOption: ZoomOption(initZoom: 20))),
    );
  }
}
