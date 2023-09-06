import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/isar/record/record_collection.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Record> recordList,
  }) = _HomePageState;
}
