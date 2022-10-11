import 'package:ageo/locationHelper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
   const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _cameraPosition=const CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746,);
  late GoogleMapController googleMapController;
   Set<Marker> _marker={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/2-50,
                  child: GoogleMap(
                    initialCameraPosition:const CameraPosition(target: LatLng(0.0,0.0)),
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    markers: _marker,
                    // padding:const EdgeInsets.only(bottom: 60),
                    onTap: (LatLng latLng){
                      _marker={};
                      _marker.add(Marker(
                          markerId:const MarkerId("Selected Location"),
                          position:latLng
                      ));
                      setState(() {});
                    },
                    onMapCreated: (GoogleMapController controller)async {
                      googleMapController =controller;
                      // print("this is map id =>${await controller.getVisibleRegion()}");
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 8.0),
                  child: FloatingActionButton(
                    child:const Icon(Icons.my_location_outlined),
                    onPressed: ()async{
                      LocationHelper locationHelper=LocationHelper();
                      // googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                      Position currentLocation=await locationHelper.getLocation();
                      _cameraPosition=CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude),zoom: 14.4746,);
                      googleMapController.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
