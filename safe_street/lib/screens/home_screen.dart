import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_street/models/location.dart';
import 'package:safe_street/models/maps_function.dart';
import 'package:safe_street/screens/score_detail_screen.dart';
import 'package:safe_street/utilities/database_functions.dart';
import 'package:safe_street/utilities/static_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routename = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  Set<Marker> _markers = Set();
  LatLng _initiale = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
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
              if (data != null) {
                _initiale = data;
              }
              return GoogleMap(
                onTap: (latLang) async {
                  print("ontap");
                  var place = await MapFunctions.getPlaceName(
                      latLang.latitude, latLang.longitude);
                  print("LOCATION: " + place.toString());

                  final data = await getLocationDetails(place['SubLocality']!);
                  double averageRating = 0;
                  double totalRatings = 0;
                  int ratingCount = 0;
                  if (data.isNotEmpty) {
                    final SafeStreetLocation locData =
                        SafeStreetLocation.fromMap(data);

                    locData.experienceRatingId.forEach(
                      (element) {
                        totalRatings += element['rating'];
                        ratingCount += 1;
                      },
                    );
                    averageRating = totalRatings / ratingCount;
                  }

                  setState(() {
                    _markers.clear();
                    _markers.add(
                      Marker(
                        markerId: MarkerId(
                            place['name'] ?? StaticData.currentUser.city),
                        position: latLang,
                        // infoWindow: InfoWindow(
                        //   title: place['name'] ?? place['sublocality'],
                        //   snippet: "SafeStreet Rating: 3.5/5 ",
                        // onTap: () {
                        //   print("Pressed");
                        //   StaticData.markerDetails['name'] =
                        //       place['name'] ?? place['SubLocality'];
                        //   StaticData.markerDetails['latitude'] =
                        //       latLang.latitude.toString();
                        //   StaticData.markerDetails['longitude'] =
                        //       latLang.longitude.toString();
                        //   StaticData.markerDetails['SafeStreet Rating'] =
                        //       "3.5";
                        //   Navigator.of(context)
                        //       .pushNamed(ScoreDetailsScreen.routeName);
                        // },
                        // ),
                        infoWindow: InfoWindow(
                          // title: place['name'] ?? place['sublocality'],
                          // snippet: "SafeStreet Rating: 3.5/5 ",
                          title: place['SubLocality'],
                          snippet: "SafeStreet Rating: ${averageRating}//5",
                          onTap: () {
                            print("Pressed");
                            StaticData.markerDetails['name'] =
                                place['name'] ?? place['SubLocality'];
                            StaticData.markerDetails['latitude'] =
                                latLang.latitude.toString();
                            StaticData.markerDetails['longitude'] =
                                latLang.longitude.toString();
                            StaticData.markerDetails['SafeStreet Rating'] =
                                "3.5";
                            Navigator.of(context)
                                .pushNamed(ScoreDetailsScreen.routeName);
                          },
                        ),
                      ),
                    );
                  });
                  await mapController.showMarkerInfoWindow(
                      MarkerId(place['name'] ?? StaticData.currentUser.city));
                },
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _initiale,
                  zoom: 11.0,
                ),
                markers: _markers,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
