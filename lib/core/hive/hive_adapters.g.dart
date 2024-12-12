// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 0;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      region: fields[2] as String,
      country: fields[3] as String,
      lat: (fields[4] as num).toDouble(),
      lon: (fields[5] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.lon);
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
