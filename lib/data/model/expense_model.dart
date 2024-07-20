import 'package:hive_flutter/hive_flutter.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 1)
class ExpenseDataModel {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String notes;

  @HiveField(2)
  final DateTime date;

 @HiveField(3)
  String? id;

 @HiveField(4)
  String category;

  ExpenseDataModel(
      {required this.amount,
      required this.notes,
      required this.date,
   this.id,
   required this.category});
      }

