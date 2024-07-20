// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseDataModelAdapter extends TypeAdapter<ExpenseDataModel> {
  @override
  final int typeId = 1;

  @override
  ExpenseDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseDataModel(
      amount: fields[0] as double,
      notes: fields[1] as String,
      date: fields[2] as DateTime,
      id: fields[3] as String?,
      category: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
