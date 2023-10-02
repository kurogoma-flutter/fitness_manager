import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_item.freezed.dart';

@freezed
class TipItem with _$TipItem {
  const factory TipItem({
    required String id,
    required String thumbnailUrl,
    required String title,
    required String linkUrl,
  }) = _TipItem;
}
