
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_firbase_app/ui/tab_box/map/widget/app_icon_bytes.dart';


import '../../../data/hive/hive_box.dart';
import '../../../data/model/branch/branch_model.dart';
import '../../../utils/app_dialog.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.branchBox.listenable(),
        builder: (context, Box<BranchModel> box, child) {
          _setUpMarkers(box.values.toList());
          return GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            markers: _markers,
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.289711812226926, 69.26581956446171),
              zoom: 11.5,
            ),
            
          );
          
        },
        
      ),
      
    );  
  }
  Marker _setMarker(BranchModel branch) {
    final icon = BitmapDescriptor.fromBytes(
      Uint8List.fromList(AppIconBytes.mapMarkerBytes),
    );
    LatLng latLng = const LatLng(
       41.334122,
       69.144771,
    );

    return Marker(
      markerId: MarkerId(branch.key),
      position: latLng,
      icon: icon,
      visible: branch.isActive ?? true,
      onTap: () async {
        AppDialog dialog = AppDialog(context);
        dialog.showBranchInfoDialog(branch: branch);
      },
    );
  }

  Future<void> _setUpMarkers(List<BranchModel> branches) async {
    for (var branch in branches) {
      _markers.add(_setMarker(branch));
    }
  }
}