import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

import '../state_models/user_details_data.dart';

class GoogleMapScreen extends StatefulWidget {
  static const routeName = "/map";

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  PlacesSearchResponse hospitals;
  @override
  void initState() {
    hospitals = context.read<UserData>().nearbyHospitals;
    f();
    super.initState();
  }

  // Does not work now and there is nothing wrong with code :)
  void f() {
    print("Showing places. Length is ${hospitals.results.length}");
    List<PlacesSearchResult> placesList = hospitals.results;
    for (final place in placesList) {
      print(place.name);
    }
  }

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
