import 'dart:io';

import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/common_component.dart';
import 'package:ageo/helpers/locationHelper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final ReportEventController _reportEventController=Get.find();

  late final GoogleMapController googleMapController;

  CameraPosition cameraPosition=const CameraPosition(target: LatLng(0.0,0.0));

  final LocationHelper _locationHelper=LocationHelper();

  late CustomThemeData appTheme;

  final CommonComponent _commonComponent=CommonComponent();

  // final currentLocationBitmapDescriptor=  BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(18, 18)), 'assets/images/report_event/map_view/current_location_ic.png',);
  //
  // final markedLocationBitmapDescriptor=  BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(18, 18)), 'assets/images/report_event/map_view/location_pin_ic.png',);

  // void testFunction()async{
   void markCurrentLocation({required LatLng latLng})async{
     try{
       _reportEventController.markCurrentLocation(
         marker: Marker(
           markerId:const MarkerId("My Location"),
           position:latLng,
           // icon: await currentLocationBitmapDescriptor,
         ),
         latLng: latLng,
       );
       // print(latLng);

     }catch(_){
       // print("This is map error => $e");
     }
   }

   Future<void> changeZoomLevel({required double zoomLevel})async{
     LatLngBounds latLngBounds=await googleMapController.getVisibleRegion();
     await googleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds,zoomLevel));
   }

   Future<void> getCurrentLocation()async{
     LatLng currentLatLan;
     if(_reportEventController.markedLocationMarker!=null){
       currentLatLan=_reportEventController.markedLocationMarker!.position;
     }else{
       Position currentLocation=await _locationHelper.getLocation();
       currentLatLan=LatLng(currentLocation.latitude, currentLocation.longitude);
       markCurrentLocation(latLng: currentLatLan);
     }
     cameraPosition=CameraPosition(target: currentLatLan,zoom: _reportEventController.mapZoomLevel.value,);
     googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
   }

   Future<void> initializeLocation()async{
     _commonComponent.initializeLoader(context: context,message: "Fetching location info");
     bool permissionGranted=await _locationHelper.checkLocationPermission(context: context);
     Get.back();
     if(permissionGranted){
       _commonComponent.initializeLoader(context: context,message: "Fetching location info");
       await getCurrentLocation();
       Get.back();
     }else{
       // Navigator.pop(context);
       locationPermissionFailAlert(context: context);
     }
   }

   void locationPermissionFailAlert({required BuildContext context}){
     showDialog(context: context,barrierDismissible: false ,builder: (BuildContext context){
       return WillPopScope(
         onWillPop:()async{
           return false;
         },
         child: Align(
           alignment: Alignment.center,
           child: Container(
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(8)
             ),
             padding:const EdgeInsets.all(20),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text("Fail to fetch location detail",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),),
                 TextButton(
                   style: TextButton.styleFrom(
                       backgroundColor: appTheme.primaryActionColor
                   ),
                   child: const Text("Try Again",style: TextStyle(fontSize: 14,color: Colors.white),),
                   onPressed: ()async{
                     Get.back();
                     initializeLocation();
                   },
                 ),
               ],
             ),
           ),
         ),
       );
     });
   }

  @override
  Widget build(BuildContext context) {
     appTheme=Theme.of(context).customTheme;
     Future.delayed(const Duration(milliseconds: 500),(){
       initializeLocation();
     });
    return GetBuilder<ReportEventController>(
      builder:(controller)=> Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
            mapType: controller.mapType,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: controller.locationMarker,
            trafficEnabled: controller.enableTrafficMode.value,
            onTap: (LatLng latLng)async{
              try{
                _reportEventController.markLocation(
                    marker:Marker(
                      markerId:const MarkerId("Selected Location"),
                      position:latLng,
                      // icon: await markedLocationBitmapDescriptor,
                    ),
                    locationCoordinate: latLng
                );
              }catch(_){}
            },
            onMapCreated: (GoogleMapController controller)async {
              googleMapController =controller;
            },
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:const EdgeInsets.only(top: 12.0,right:12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child:Container(
                      height:45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.white,width: 5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: const Offset(0, 3),
                                blurRadius: 6
                            )
                          ]
                      ),
                      child: const Icon(Icons.layers,color: Colors.white,),
                    ),
                    onTap: (){
                      controller.changeMapOptionState();
                    },
                  ),

                  Visibility(
                    visible: !controller.hideMapModeOption.value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child:Container(
                              height:45,
                              width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.white,width: 5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.16),
                                        offset: const Offset(0, 3),
                                        blurRadius: 6
                                    )
                                  ]
                              ),
                              child: Image.asset("assets/images/report_event/map_view/traffic_view_ic.png"),
                            ),
                            onTap: (){
                              controller.toggleTrafficMode();
                              controller.changeMapOptionState();
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: GestureDetector(
                              child:Container(
                                height:45,
                                width: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.white,width: 5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          offset: const Offset(0, 3),
                                          blurRadius: 6
                                      )
                                    ]
                                ),
                                child: Image.asset("assets/images/report_event/map_view/satellite_view_ic.png"),
                              ),
                              onTap: (){
                                controller.changeMapType(value: MapType.satellite);
                                controller.changeMapOptionState();
                              },
                            ),
                          ),
                          GestureDetector(
                            child:Container(
                              height:45,
                              width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.white,width: 5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.16),
                                        offset: const Offset(0, 3),
                                        blurRadius: 6
                                    )
                                  ]
                              ),
                              child: Image.asset("assets/images/report_event/map_view/default_view_ic.png"),
                            ),
                            onTap: (){
                              controller.changeMapType(value: MapType.normal);
                              controller.changeMapOptionState();
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            right: 12,
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    height: 38,
                    width: 38,
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // height and width of this widget is controller by padding of parent container
                    child: Image.asset("assets/images/report_event/map_view/my_location_ic.png",color: appTheme.iconColor,width: 15,),
                  ),
                  onTap: ()async{
                    getCurrentLocation();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 4.0),
                  child: GestureDetector(
                    onTap: (){
                      changeZoomLevel(zoomLevel: -100);
                    },
                    child: Container(
                      height: 38,
                      width: 38,
                      padding:const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      // height and width of this widget is controller by padding of parent container
                      child: Image.asset("assets/images/report_event/map_view/zoom_in_ic.png",color: appTheme.iconColor,),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    changeZoomLevel(zoomLevel: 150);
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // height and width of this widget is controller by padding of parent container
                    child: Image.asset("assets/images/report_event/map_view/zoom_out_ic.png",color: appTheme.iconColor,),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: _reportEventController.eventDetail.location!=null,
              child: SizedBox(
                height: Platform.isIOS? 50:40,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: appTheme.primaryActionColor,
                  ),
                  onPressed: ()async{
                    if(_reportEventController.quickReportingIsActive.value){
                      _reportEventController.changeActiveScreen(value: "event_type");
                    }else{
                      _reportEventController.changeActiveTab(value: "questions");
                    }
                  },
                  child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
