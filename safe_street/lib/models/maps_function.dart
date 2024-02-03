import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFunctions {
  static Future<String> getPlaceName(double latitude, double longitude) async {
    // try {
    //   List<Placemark> placemarks =
    //       await placemarkFromCoordinates(latitude, longitude);

    //   if (placemarks.isNotEmpty) {
    //     Placemark first = placemarks.first;
    //     String placeName =
    //         '${first.name}, ${first.subThoroughfare}, ${first.thoroughfare}, ${first.subLocality}, ${first.locality}, ${first.subAdministrativeArea}, ${first.administrativeArea}, ${first.country}';
    //     return placeName;
    //   } else {
    //     return 'No placemarks found';
    //   }
    // } catch (e) {
    //   print('Error retrieving placemark: $e');
    //   return 'Error retrieving placemark';
    // }

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark first = placemarks.first;
        String placeDetails = 'Name: ${first.name}\n'
            'Thoroughfare: ${first.thoroughfare}\n'
            'SubThoroughfare: ${first.subThoroughfare}\n'
            'Locality: ${first.locality}\n'
            'SubLocality: ${first.subLocality}\n'
            'AdministrativeArea: ${first.administrativeArea}\n'
            'SubAdministrativeArea: ${first.subAdministrativeArea}\n'
            'Country: ${first.country}\n'
            'PostalCode: ${first.postalCode}';

        print(placeDetails);
        // You can use placeDetails as needed in your app
        return placeDetails;
      } else {
        print('No placemarks found');
        return '';
      }
    } catch (e) {
      print('Error retrieving placemark: $e');
      return '';
    }
  }

  static Future<LatLng?> getLatLngFromAddress(String address) async {
    try {
      print(address);
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        Location first = locations.first;
        LatLng latLng = LatLng(first.latitude, first.longitude);
        return latLng;
      } else {
        print('No locations found for address: $address');
        return null;
      }
    } catch (e) {
      print('Error retrieving coordinates: $e');
      return null;
    }
  }
}
