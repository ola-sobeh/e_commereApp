import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController googleMapController;
  LatLng centerPoint = LatLng(25.276987, 55.296249);
  LatLng shopPoint = LatLng(25.276987, 55.296249);
  Set<Marker> markers = {};

  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 20)));
    markers.add(Marker(
        markerId: MarkerId('MyLocation'),
        position: LatLng(position.latitude, position.longitude)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('Google Maps',style: TextStyle(color: Colors.black),),
      ),
      body: GoogleMap(
        onTap: (x) {
          print(x);
          // markers.add(Marker(
          //     markerId: MarkerId('${x.latitude}_${x.longitude}'), position: x));
          // setState(() {});
        },
        markers: markers,
        onMapCreated: (controller) {
          this.googleMapController = controller;
          getUserLocation();
        },
        initialCameraPosition: CameraPosition(
          target: centerPoint,
          zoom: 11.0,
        ),
      ),

    );
  }
}
