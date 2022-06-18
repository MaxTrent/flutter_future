import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    getPosition().then((Position? myPos) {
      myPosition = 'Latitude: ' +
          myPos!.latitude.toString() +
          '- Longitude: ' +
          myPos.longitude.toString();
      setState(() {
        myPosition = myPosition;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Position'),
      ),
      body: Center(
        child: Text(myPosition),
      ),
    );
  }

  Future<Position?> getPosition() async {
    Position? position = await Geolocator.getLastKnownPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
