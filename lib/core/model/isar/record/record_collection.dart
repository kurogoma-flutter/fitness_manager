import 'package:isar/isar.dart';

import '../../../enum/rm_unit_type.dart';
import '../../../enum/weight_unit_type.dart';

part 'record_collection.g.dart';

@Collection()
class Record {
  Id id = Isar.autoIncrement;

  int num = Isar.autoIncrement;

  late String category;

  late double load;

  @enumerated
  late WeightUnitType weightUnitType;

  late int time;

  @enumerated
  late RmUnitType rmUnitType;

  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;
}
