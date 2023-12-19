import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/model/tip_item/tip_item.dart';

part 'tips_page_state.freezed.dart';

@freezed
class TipsPageState with _$TipsPageState {
  const factory TipsPageState({
    @Default([]) List<TipItem> tipList,
    @Default(false) bool isLoading,
  }) = _TipsPageState;
}
