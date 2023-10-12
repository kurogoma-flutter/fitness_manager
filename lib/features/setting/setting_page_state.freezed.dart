// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingPageState {
  String get appVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingPageStateCopyWith<SettingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingPageStateCopyWith<$Res> {
  factory $SettingPageStateCopyWith(
          SettingPageState value, $Res Function(SettingPageState) then) =
      _$SettingPageStateCopyWithImpl<$Res, SettingPageState>;
  @useResult
  $Res call({String appVersion});
}

/// @nodoc
class _$SettingPageStateCopyWithImpl<$Res, $Val extends SettingPageState>
    implements $SettingPageStateCopyWith<$Res> {
  _$SettingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
  }) {
    return _then(_value.copyWith(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingPageStateCopyWith<$Res>
    implements $SettingPageStateCopyWith<$Res> {
  factory _$$_SettingPageStateCopyWith(
          _$_SettingPageState value, $Res Function(_$_SettingPageState) then) =
      __$$_SettingPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appVersion});
}

/// @nodoc
class __$$_SettingPageStateCopyWithImpl<$Res>
    extends _$SettingPageStateCopyWithImpl<$Res, _$_SettingPageState>
    implements _$$_SettingPageStateCopyWith<$Res> {
  __$$_SettingPageStateCopyWithImpl(
      _$_SettingPageState _value, $Res Function(_$_SettingPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
  }) {
    return _then(_$_SettingPageState(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingPageState implements _SettingPageState {
  const _$_SettingPageState({this.appVersion = ''});

  @override
  @JsonKey()
  final String appVersion;

  @override
  String toString() {
    return 'SettingPageState(appVersion: $appVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingPageState &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingPageStateCopyWith<_$_SettingPageState> get copyWith =>
      __$$_SettingPageStateCopyWithImpl<_$_SettingPageState>(this, _$identity);
}

abstract class _SettingPageState implements SettingPageState {
  const factory _SettingPageState({final String appVersion}) =
      _$_SettingPageState;

  @override
  String get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$_SettingPageStateCopyWith<_$_SettingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
