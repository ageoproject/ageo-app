import 'package:ageo/helpers/locationHelper.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
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
  LocationHelper _locationHelper=LocationHelper();
   Set<Marker> _marker={};
   bool _enableTrafficView=false;
   MapType _mapType=MapType.normal;
   String? _address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:const CameraPosition(target: LatLng(0.0,0.0)),
              mapToolbarEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: _mapType,
              markers: _marker,
              trafficEnabled: _enableTrafficView,
              // padding:const EdgeInsets.only(bottom: 60),
              onTap: (LatLng latLng)async{
                _marker={};
                _marker.add(Marker(
                    markerId:const MarkerId("Selected Location"),
                    position:latLng
                ));
                GeoData geoAddress=await _locationHelper.getCoordinateDetails(latitude: latLng.latitude, longitude: latLng.longitude);
                _address=geoAddress.address;
                setState(() {});
              },
              onMapCreated: (GoogleMapController controller)async {
                googleMapController =controller;
                // print("this is map id =>${await controller.getVisibleRegion()}");
              },

            ),

            Visibility(
              visible: _address!=null,
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
                        child: Text("$_address",style:const TextStyle(color: Colors.black87),),
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
                  // googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                  Position currentLocation=await _locationHelper.getLocation();
                  _cameraPosition=CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude),zoom: 14.4746,);
                  googleMapController.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
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
        ),
      ),

    );
  }
}
