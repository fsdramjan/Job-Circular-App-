// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlistModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistModelAdapter extends TypeAdapter<WishlistModel> {
  @override
  final int typeId = 1;

  @override
  WishlistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistModel(
      id: fields[3] as String?,
      name: fields[0] as String?,
      deadline: fields[1] as String?,
      description: fields[2] as String?,
      numberOfPost: fields[4] as String?,
      wishItemType: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.deadline)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.numberOfPost)
      ..writeByte(5)
      ..write(obj.wishItemType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
