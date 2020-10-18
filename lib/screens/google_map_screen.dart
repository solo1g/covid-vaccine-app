import 'package:covidvaccineapp/state%20models/user_details_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatelessWidget {
  static const routeName = "/map";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(context.watch<UserData>().userLocation.latitude,
              context.watch<UserData>().userLocation.longitude),
          zoom: 18,
        ),
      ),
    );
  }
}
