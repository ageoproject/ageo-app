import 'dart:ui';

import 'package:ageo/ageoConfig.dart';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/locationHelper.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
   const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _cameraPosition=const CameraPosition(target: LatLng(0.0,0.0));
  final ReportEventController _reportEventController=Get.find();
  late GoogleMapController googleMapController;
  final LocationHelper _locationHelper=LocationHelper();
  Set<Marker> _locationMarker={};
  bool _enableTrafficView=false;
  MapType _mapType=MapType.normal;
  GeoData? _address;
  late List<double> _location;

   // void testFunction()async{
   //   AgeoConfig ageoConfig=AgeoConfig();
   //   String? eventId=await ageoConfig.reportEvent(location: _location,geoData: _address!);
   //   print("Event Reported successfully and eventId is => $eventId");
   // }

   void markCurrentLocation({required LatLng latLng})async{
     int iconSize=88;
     // const iconData = Icons.location_history;
     // final pictureRecorder = PictureRecorder();
     // final canvas = Canvas(pictureRecorder);
     // final textPainter = TextPainter(textDirection: TextDirection.ltr);
     // final iconStr = String.fromCharCode(iconData.codePoint);
     // textPainter.text = TextSpan(
     //     text: iconStr,
     //     style: TextStyle(
     //       letterSpacing: 0.0,
     //       fontSize:  double.parse(iconSize.toString()),
     //       fontFamily: iconData.fontFamily,
     //       color: Colors.red,
     //     )
     // );
     // textPainter.layout();
     // textPainter.paint(canvas, Offset(0.0, 0.0));
     // final picture = pictureRecorder.endRecording();
     // final image = await picture.toImage(iconSize, iconSize);
     // final bytes = await image.toByteData(format: ImageByteFormat.png);
     // final bitmapDescriptor = BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());

     final bitmapDescriptor=await  BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(18, 18)), 'assets/images/report_event/img.png',);
     _reportEventController.markLocation(value: Marker(
         markerId:const MarkerId("My Location"),
         position:latLng,
       flat: true,
       icon: bitmapDescriptor
     ));
     _reportEventController.markCurrentLocation(value: latLng);
   }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition,
          mapType: _mapType,
          mapToolbarEnabled: false,
          markers: _reportEventController.locationMarker,
          trafficEnabled: _enableTrafficView,
          onTap: (LatLng latLng)async{
            _locationMarker={};
            _reportEventController.markLocation(value:Marker(
                markerId:const MarkerId("Selected Location"),
                position:latLng
            ));
            _location=[latLng.latitude,latLng.longitude];
            _address=await _locationHelper.getCoordinateDetails(latitude: latLng.latitude, longitude: latLng.longitude);
            setState(() {});
          },
          onMapCreated: (GoogleMapController controller)async {
            googleMapController =controller;
            // print("this is map id =>${await controller.getVisibleRegion()}");
          },

        ),

        Visibility(
          visible: _address?.address!=null,
          child: Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on,color: Colors.black87,),
                  Expanded(
                    child: Text("${_address?.address}",style:const TextStyle(color: Colors.black87),),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 110,
          right: 12,
          child: GestureDetector(
            child: Container(
              color: Colors.white,
              padding:const EdgeInsets.all(8),
              child:const Icon(Icons.my_location,color: Colors.black87,),
            ),
            onTap: ()async{
              Position currentLocation=await _locationHelper.getLocation();
              LatLng currentLatLan=LatLng(currentLocation.latitude, currentLocation.longitude);
              _cameraPosition=CameraPosition(target: currentLatLan,zoom: 14.4746,);
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
              markCurrentLocation(latLng: currentLatLan);
              print(" this is my current latitude: ${currentLocation.latitude} longitude: ${currentLocation.longitude}");
              setState(() {});
            },
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0),
            child: PopupMenuButton(
              constraints:const BoxConstraints(
                  maxWidth: 50
              ),
              padding: const EdgeInsets.only(right: 8),
              icon:const Icon(Icons.layers_outlined),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    // padding:const EdgeInsets.all(8),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.satellite_alt,),
                    ),
                    onTap: (){
                      setState(() {
                        _mapType=MapType.satellite;
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.traffic_outlined)
                    ),
                    onTap: (){
                      setState(() {
                        _enableTrafficView=!_enableTrafficView;
                      });
                    },
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.map_outlined),
                    ),
                    onTap: (){
                      setState(() {
                        _mapType=MapType.normal;
                      });
                    },
                  ),
                ];
              },
            ),
          ),
        ),

      ],
    );
  }
}
