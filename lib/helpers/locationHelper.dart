import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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
  
  Future<bool> checkLocationPermission({required BuildContext context})async{
    bool serviceEnabled;
    LocationPermission permission;
    String errorMessage="";
    
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        errorMessage= 'Location permissions are denied';
        await showLocationPermissionError(context: context, errorMessage: errorMessage, actionType: "permission_denied");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      errorMessage='Location permissions are permanently denied, we cannot request permissions.';
      await showLocationPermissionError(context: context, errorMessage: errorMessage, actionType: "permission_denied_permanently");
      return false;
    }
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      errorMessage="Location services are disabled.";
      await showLocationPermissionError(context: context, errorMessage: errorMessage, actionType: "enable_location");
      return false;
    }
    return true;
  }

  Future<GeoData> getCoordinateDetails({required double latitude,required double longitude})async{
    GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: latitude,
        longitude: longitude,
        googleMapApiKey: "AIzaSyBNr1H9xOYypZMoB2rTtVTAbe-B6_n8zwM");
    return data;
  }
  
  Future<void> showLocationPermissionError({required BuildContext context,required String errorMessage,required String actionType})async{
    CustomThemeData appTheme=Theme.of(context).customTheme;
    await showDialog(context: context,barrierDismissible: false , builder: (BuildContext context){
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      // child: Text("Close",style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor),),
                      child: Icon(Icons.close,color: appTheme.primaryTextColor,size: 24,),
                      onPressed: (){
                        Get.back();
                      },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,8,20,20),
                  child: Column(

                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(errorMessage,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),textAlign: TextAlign.center,),
                      ),
                      Visibility(
                        visible: actionType=="enable_location",
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: appTheme.primaryActionColor
                          ),
                          child: const Text("Enable",style: TextStyle(fontSize: 14,color: Colors.white),),
                          onPressed: ()async{
                            Get.back();
                            Geolocator.openLocationSettings();
                          },
                        ),
                      ),
                      Visibility(
                        visible: actionType=="permission_denied",
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: appTheme.primaryActionColor
                          ),
                          child: const Text("Allow Permission",style: TextStyle(fontSize: 14,color: Colors.white),),
                          onPressed: ()async{
                            await Geolocator.requestPermission();
                            Get.back();
                          },
                        ),
                      ),
                      Visibility(
                        visible: actionType=="permission_denied_permanently",
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: appTheme.primaryActionColor
                          ),
                          child: const Text("Open Setting",style: TextStyle(fontSize: 14,color: Colors.white),),
                          onPressed: ()async{
                            Get.back();
                            openAppSettings();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}