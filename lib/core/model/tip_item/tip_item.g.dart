// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TipItem _$$_TipItemFromJson(Map<String, dynamic> json) => _$_TipItem(
      id: json['id'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      linkUrl: json['linkUrl'] as String,
    );

Map<String, dynamic> _$$_TipItemToJson(_$_TipItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'linkUrl': instance.linkUrl,
    };
