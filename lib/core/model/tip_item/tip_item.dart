// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_item.freezed.dart';
part 'tip_item.g.dart';

@freezed
class TipItem with _$TipItem {
  const factory TipItem({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'thumbnailUrl') required String thumbnailUrl,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'linkUrl') required String linkUrl,
  }) = _TipItem;

  factory TipItem.fromJson(Map<String, dynamic> json) =>
      _$TipItemFromJson(json);
}
