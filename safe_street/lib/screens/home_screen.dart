import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_street/models/maps_function.dart';
import 'package:safe_street/utilities/static_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routename = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  LatLng _initiale = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: MapFunctions.getLatLngFromAddress(
              "${StaticData.currentUser.city}, ${StaticData.currentUser.country}"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              _initiale = data!;
              return GoogleMap(
                onTap: (latLang) async {
                  print("ontap");
                  var place = await MapFunctions.getPlaceName(
                      latLang.latitude, latLang.longitude);
                  print("LOCATION: " + place.toString());
                },
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _initiale,
                  zoom: 11.0,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
