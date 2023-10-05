// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipItem _$TipItemFromJson(Map<String, dynamic> json) {
  return _TipItem.fromJson(json);
}

/// @nodoc
mixin _$TipItem {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnailUrl')
  String get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkUrl')
  String get linkUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipItemCopyWith<TipItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipItemCopyWith<$Res> {
  factory $TipItemCopyWith(TipItem value, $Res Function(TipItem) then) =
      _$TipItemCopyWithImpl<$Res, TipItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'thumbnailUrl') String thumbnailUrl,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'linkUrl') String linkUrl});
}

/// @nodoc
class _$TipItemCopyWithImpl<$Res, $Val extends TipItem>
    implements $TipItemCopyWith<$Res> {
  _$TipItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? linkUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipItemCopyWith<$Res> implements $TipItemCopyWith<$Res> {
  factory _$$_TipItemCopyWith(
          _$_TipItem value, $Res Function(_$_TipItem) then) =
      __$$_TipItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'thumbnailUrl') String thumbnailUrl,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'linkUrl') String linkUrl});
}

/// @nodoc
class __$$_TipItemCopyWithImpl<$Res>
    extends _$TipItemCopyWithImpl<$Res, _$_TipItem>
    implements _$$_TipItemCopyWith<$Res> {
  __$$_TipItemCopyWithImpl(_$_TipItem _value, $Res Function(_$_TipItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? linkUrl = null,
  }) {
    return _then(_$_TipItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipItem implements _TipItem {
  const _$_TipItem(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'thumbnailUrl') required this.thumbnailUrl,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'linkUrl') required this.linkUrl});

  factory _$_TipItem.fromJson(Map<String, dynamic> json) =>
      _$$_TipItemFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'linkUrl')
  final String linkUrl;

  @override
  String toString() {
    return 'TipItem(id: $id, thumbnailUrl: $thumbnailUrl, title: $title, linkUrl: $linkUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, thumbnailUrl, title, linkUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipItemCopyWith<_$_TipItem> get copyWith =>
      __$$_TipItemCopyWithImpl<_$_TipItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TipItemToJson(
      this,
    );
  }
}

abstract class _TipItem implements TipItem {
  const factory _TipItem(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'thumbnailUrl') required final String thumbnailUrl,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'linkUrl') required final String linkUrl}) = _$_TipItem;

  factory _TipItem.fromJson(Map<String, dynamic> json) = _$_TipItem.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'thumbnailUrl')
  String get thumbnailUrl;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'linkUrl')
  String get linkUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TipItemCopyWith<_$_TipItem> get copyWith =>
      throw _privateConstructorUsedError;
}
