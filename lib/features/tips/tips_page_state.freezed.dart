// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TipsPageState {
  List<TipItem> get tipList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipsPageStateCopyWith<TipsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsPageStateCopyWith<$Res> {
  factory $TipsPageStateCopyWith(
          TipsPageState value, $Res Function(TipsPageState) then) =
      _$TipsPageStateCopyWithImpl<$Res, TipsPageState>;
  @useResult
  $Res call({List<TipItem> tipList});
}

/// @nodoc
class _$TipsPageStateCopyWithImpl<$Res, $Val extends TipsPageState>
    implements $TipsPageStateCopyWith<$Res> {
  _$TipsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipList = null,
  }) {
    return _then(_value.copyWith(
      tipList: null == tipList
          ? _value.tipList
          : tipList // ignore: cast_nullable_to_non_nullable
              as List<TipItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipsPageStateCopyWith<$Res>
    implements $TipsPageStateCopyWith<$Res> {
  factory _$$_TipsPageStateCopyWith(
          _$_TipsPageState value, $Res Function(_$_TipsPageState) then) =
      __$$_TipsPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TipItem> tipList});
}

/// @nodoc
class __$$_TipsPageStateCopyWithImpl<$Res>
    extends _$TipsPageStateCopyWithImpl<$Res, _$_TipsPageState>
    implements _$$_TipsPageStateCopyWith<$Res> {
  __$$_TipsPageStateCopyWithImpl(
      _$_TipsPageState _value, $Res Function(_$_TipsPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipList = null,
  }) {
    return _then(_$_TipsPageState(
      tipList: null == tipList
          ? _value._tipList
          : tipList // ignore: cast_nullable_to_non_nullable
              as List<TipItem>,
    ));
  }
}

/// @nodoc

class _$_TipsPageState implements _TipsPageState {
  const _$_TipsPageState({final List<TipItem> tipList = const []})
      : _tipList = tipList;

  final List<TipItem> _tipList;
  @override
  @JsonKey()
  List<TipItem> get tipList {
    if (_tipList is EqualUnmodifiableListView) return _tipList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tipList);
  }

  @override
  String toString() {
    return 'TipsPageState(tipList: $tipList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipsPageState &&
            const DeepCollectionEquality().equals(other._tipList, _tipList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tipList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipsPageStateCopyWith<_$_TipsPageState> get copyWith =>
      __$$_TipsPageStateCopyWithImpl<_$_TipsPageState>(this, _$identity);
}

abstract class _TipsPageState implements TipsPageState {
  const factory _TipsPageState({final List<TipItem> tipList}) =
      _$_TipsPageState;

  @override
  List<TipItem> get tipList;
  @override
  @JsonKey(ignore: true)
  _$$_TipsPageStateCopyWith<_$_TipsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
