import '../core/enum/rm_unit_type.dart';
import '../core/enum/weight_unit_type.dart';
import '../core/isar/record/record_collection.dart';

final List<Record> dummyRecordList = [
  Record()
    ..id = 1
    ..num = 1
    ..category = 'ベンチプレス'
    ..load = 60
    ..weightUnitType = WeightUnitType.kg
    ..time = '10'
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 2
    ..num = 2
    ..category = 'ショルダープレス'
    ..load = 75
    ..weightUnitType = WeightUnitType.kg
    ..time = '8'
    ..rmUnitType = RmUnitType.rm,
  Record()
    ..id = 3
    ..num = 3
    ..category = 'レッグプレス'
    ..load = 90
    ..weightUnitType = WeightUnitType.kg
    ..time = '8'
    ..rmUnitType = RmUnitType.rm,
  Record()
    ..id = 1
    ..num = 1
    ..category = 'ベンチプレス'
    ..load = 60
    ..weightUnitType = WeightUnitType.kg
    ..time = '10'
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 2
    ..num = 2
    ..category = 'ショルダープレス'
    ..load = 75
    ..weightUnitType = WeightUnitType.kg
    ..time = '8'
    ..rmUnitType = RmUnitType.rm,
  Record()
    ..id = 3
    ..num = 3
    ..category = 'レッグプレス'
    ..load = 90
    ..weightUnitType = WeightUnitType.kg
    ..time = '8'
    ..rmUnitType = RmUnitType.rm,
];
