// GENERATED CODE - DO NOT MODIFY BY HAND



// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************




part of 'branch_model.dart';


class BranchAdapter extends TypeAdapter<BranchModel> {
  @override
  final int typeId = 10;

  @override
  BranchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchModel()
      .._sId = fields[0] as String?
      .._location = fields[1] as Location?
      .._address = fields[2] as String?
      .._name = fields[3] as String?
      .._isActive = fields[4] as bool?
      .._phone = fields[5] as String?;
  }
  

  @override
  void write(BinaryWriter writer, BranchModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj._sId)
      ..writeByte(1)
      ..write(obj._location)
      ..writeByte(2)
      ..write(obj._address)
      ..writeByte(3)
      ..write(obj._name)
      ..writeByte(4)
      ..write(obj._isActive)
      ..writeByte(5)
      ..write(obj._phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 11;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location()
      .._latitude = (fields[0] as double?)!
      .._longitude = (fields[1] as double?)!;
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._latitude)
      ..writeByte(1)
      ..write(obj._longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
