import '../core/enum/rm_unit_type.dart';
import '../core/enum/weight_unit_type.dart';
import '../core/isar/record/record_collection.dart';

final List<Record> dummyRecordList = [
  Record()
    ..id = 1
    ..num = 1
    ..category = 'リバースフライ（片手）'
    ..load = 37.5
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 2
    ..num = 2
    ..category = 'ペクトラル（片手）'
    ..load = 35
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 3
    ..num = 3
    ..category = 'アブダクター'
    ..load = 100
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 4
    ..num = 4
    ..category = 'アダクター'
    ..load = 90
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 5
    ..num = 5
    ..category = 'レッグエクステンション'
    ..load = 107.5
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 6
    ..num = 6
    ..category = 'インクラインチェストプレス'
    ..load = 100
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 7
    ..num = 7
    ..category = 'ダンベルプレス'
    ..load = 26
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 8
    ..num = 8
    ..category = 'ローロウ（片手）'
    ..load = 75.5
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 9
    ..num = 9
    ..category = 'レッグプレス'
    ..load = 250
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 10
    ..num = 10
    ..category = 'チェストプレス'
    ..load = 125
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 11
    ..num = 11
    ..category = 'ワイドチェストプレス'
    ..load = 144.8
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 12
    ..num = 12
    ..category = 'ラットマシン'
    ..load = 125
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 13
    ..num = 13
    ..category = 'トライセプスプレスダウン'
    ..load = 40
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 14
    ..num = 14
    ..category = 'アームカール'
    ..load = 37.5
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 15
    ..num = 15
    ..category = 'ショルダープレス'
    ..load = 90
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 16
    ..num = 16
    ..category = 'プルダウン'
    ..load = 125
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 17
    ..num = 17
    ..category = 'レッグカール'
    ..load = 65
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 18
    ..num = 18
    ..category = 'ダンベルカール'
    ..load = 18
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 19
    ..num = 19
    ..category = 'ダンベルフライ'
    ..load = 18
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 20
    ..num = 20
    ..category = 'ヒップスラスト'
    ..load = 135
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 21
    ..num = 21
    ..category = 'プーリー'
    ..load = 110
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
  Record()
    ..id = 22
    ..num = 22
    ..category = 'ロータリートルソー'
    ..load = 80
    ..weightUnitType = WeightUnitType.kg
    ..time = '5'
    ..rmUnitType = RmUnitType.times
    ..rmUnitType = RmUnitType.times,
];
