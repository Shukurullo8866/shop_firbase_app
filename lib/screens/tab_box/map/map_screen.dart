import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../data/hive/hive_box.dart';
import '../../../data/model/branch/branch_model.dart';
import '../../../utils/app_dialog.dart';
import '../../../utils/app_image.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markers = {};
  BranchModel branchModel = BranchModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100, width: 190),
        ),
        leading: const SizedBox(),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.branchBox.listenable(),
        builder: (context, Box<BranchModel> box, child) {
          _setUpMarkers(branchModel);
          return GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            markers: _markers,
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.320365, 69.244921),
              zoom: 11.2,
            ),
          );
        },
      ),
    );
  }

  Marker _setMarker(BranchModel branch) {
    print("_stMarker in print ++++++++++++++++++++++++++++++++++++++++");
    print(branch.phone);
    final icon =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);

    return Marker(
      markerId: MarkerId(branch.sId.toString()),
      position: const LatLng(
        41.334122,
        69.144771,
      ),
      icon: icon,
      visible: true,
      onTap: () async {
        print(
            "return Marker in print *****************************************************");
        print(branch.phone);
        AppDialog dialog = AppDialog(context);
        dialog.showBranchInfoDialog(branch: branch);
      },
    );
  }

  Future<void> _setUpMarkers(BranchModel branch) async {
    print("For in print ---------------------------------------------");
    print(branch.phone);
    _markers.add(_setMarker(branch));
  }
}
