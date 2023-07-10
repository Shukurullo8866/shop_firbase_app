


// ignore: duplicate_import
import 'package:hive_flutter/adapters.dart';

import 'hive_adapter.dart';

part 'branch_model,g.dart';


@HiveType(typeId: HiveTypes.branch, adapterName: HiveAdapters.branch)
class BranchModel extends HiveObject {
  @override
  String get key => _sId!;

  @HiveField(0)
  String? _sId;

  @HiveField(1)
  Location? _location;

  @HiveField(2)
  String? _address;

  @HiveField(3)
  String? _name;

  @HiveField(4)
  bool? _isActive;

  @HiveField(5)
  String? _phone;

  BranchModel({
    String? sId,
    Location? location,
    String? address,
    String? name,
    bool? isActive,
    String? phone,
  })  : _sId = sId,
        _location = location,
        _address = address,
        _name = name,
        _isActive = isActive,
        _phone = phone {
    _sId ??= '1';
    _location ??= Location(latitude: 41.334122, longitude: 69.144771);
    _address ??= 'Tashkent';
    _name ??= 'nmadur';
    _isActive ??= true;
    _phone ??= '+998971233323';
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get name => _name;
  set name(String? name) => _name = name;
  bool? get isActive => _isActive;
  set isActive(bool? isActive) => _isActive = isActive;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;

  BranchModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : Location();
    _address = json['address'];
    _name = json['name'];
    _isActive = json['is_active'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = _sId;
    if (_location != null) {
      data['location'] = _location!.toJson();
    }
    data['address'] = _address;
    data['name'] = _name;
    data['is_active'] = _isActive;
    data['phone'] = _phone;
    return data;
  }
}

@HiveType(typeId: HiveTypes.location, adapterName: HiveAdapters.location)
class Location {
  @HiveField(0)
  double? _latitude;

  @HiveField(1)
  double? _longitude;

  Location({double? latitude, double? longitude})
      : _latitude = latitude,
        _longitude = longitude;

  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;

  Location.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    return data;
  }
} /// It's a class that contains a static list of BranchModel objects
// class BranchData {
//   static final List<BranchModel> _branches = [
//     BranchModel(
//       "Tiin - Ulgurji Market",
//       LocaleKeys.sayramBranch,
//       "+998935559562",
//       const LatLng(41.3281858698788, 69.32101006558912),
//     ),
//     BranchModel(
//       "Tiin - Ulgurji Market",
//       LocaleKeys.yakkaSaroyBranch,
//       "+998935559562",
//       const LatLng(41.295002478807255, 69.26550840838453),
//     ),
//     BranchModel(
//       "Tiin - Ulgurji Market",
//       LocaleKeys.ferghanaRoadBranch,
//       "+998935559562",
//       const LatLng(41.253531426937606, 69.3210051104306),
//     ),
//   ];

//   static List<BranchModel> get branches => _branches;
// }
