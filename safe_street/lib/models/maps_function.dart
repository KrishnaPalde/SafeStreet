import 'package:geocoding/geocoding.dart';

class MapFunctions {
  static Future<String> getPlaceName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark first = placemarks.first;
        String placeName =
            '${first.name}, ${first.subThoroughfare}, ${first.thoroughfare}, ${first.subLocality}, ${first.locality}, ${first.subAdministrativeArea}, ${first.administrativeArea}, ${first.country}';
        return placeName;
      } else {
        return 'No placemarks found';
      }
    } catch (e) {
      print('Error retrieving placemark: $e');
      return 'Error retrieving placemark';
    }
  }
}
