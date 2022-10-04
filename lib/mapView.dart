import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746,),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,

        onTap: (LatLng latLng){
          // print(latLng);
        },
        onMapCreated: (GoogleMapController controller)async {
          // print("this is map id =>${await controller.getVisibleRegion()}");
        },

      ),
    );
  }
}
