import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper{

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled .');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<GeoData> getCoordinateDetails({required double latitude,required double longitude})async{
    GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: latitude,
        longitude: longitude,
        googleMapApiKey: "AIzaSyBNr1H9xOYypZMoB2rTtVTAbe-B6_n8zwM");
    return data;
  }
}