// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesAdapter extends TypeAdapter<Notes> {
  @override
  final int typeId = 0;

  @override
  Notes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notes(
      id: fields[4] as String?,
      title: fields[0] as String?,
      description: fields[1] as String?,
      imageList: (fields[2] as List?)?.cast<String>(),
      checkBoxList: (fields[3] as List?)?.cast<CheckBox>(),
      folderName: fields[5] as String?,
      linksName: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Notes obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.imageList)
      ..writeByte(3)
      ..write(obj.checkBoxList)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.folderName)
      ..writeByte(6)
      ..write(obj.linksName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckBoxAdapter extends TypeAdapter<CheckBox> {
  @override
  final int typeId = 1;

  @override
  CheckBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckBox(
      id: fields[2] as String?,
      description: fields[0] as String?,
      isCheck: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CheckBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isCheck)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
