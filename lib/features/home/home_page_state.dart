import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/model/isar/record/record_collection.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Record> recordList,
    @Default([]) List<Map<DateTime, int>> heatmapData,
    @Default(2023) int selectedYear,
    @Default(false) bool loading,
    // 新規データ用
    @Default('') String newRecordTitle,
    @Default(0) int weight,
    @Default(0) int rep,
  }) = _HomePageState;
}
