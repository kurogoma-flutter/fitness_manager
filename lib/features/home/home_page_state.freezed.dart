// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  List<Record> get recordList => throw _privateConstructorUsedError;
  List<Map<DateTime, int>> get heatmapData =>
      throw _privateConstructorUsedError;
  int get selectedYear => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError; // 新規データ用
  String get newRecordTitle => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get rep => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {List<Record> recordList,
      List<Map<DateTime, int>> heatmapData,
      int selectedYear,
      bool loading,
      String newRecordTitle,
      int weight,
      int rep});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? heatmapData = null,
    Object? selectedYear = null,
    Object? loading = null,
    Object? newRecordTitle = null,
    Object? weight = null,
    Object? rep = null,
  }) {
    return _then(_value.copyWith(
      recordList: null == recordList
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      heatmapData: null == heatmapData
          ? _value.heatmapData
          : heatmapData // ignore: cast_nullable_to_non_nullable
              as List<Map<DateTime, int>>,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      newRecordTitle: null == newRecordTitle
          ? _value.newRecordTitle
          : newRecordTitle // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Record> recordList,
      List<Map<DateTime, int>> heatmapData,
      int selectedYear,
      bool loading,
      String newRecordTitle,
      int weight,
      int rep});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? heatmapData = null,
    Object? selectedYear = null,
    Object? loading = null,
    Object? newRecordTitle = null,
    Object? weight = null,
    Object? rep = null,
  }) {
    return _then(_$_HomePageState(
      recordList: null == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      heatmapData: null == heatmapData
          ? _value._heatmapData
          : heatmapData // ignore: cast_nullable_to_non_nullable
              as List<Map<DateTime, int>>,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      newRecordTitle: null == newRecordTitle
          ? _value.newRecordTitle
          : newRecordTitle // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  const _$_HomePageState(
      {final List<Record> recordList = const [],
      final List<Map<DateTime, int>> heatmapData = const [],
      this.selectedYear = 2023,
      this.loading = false,
      this.newRecordTitle = '',
      this.weight = 0,
      this.rep = 0})
      : _recordList = recordList,
        _heatmapData = heatmapData;

  final List<Record> _recordList;
  @override
  @JsonKey()
  List<Record> get recordList {
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordList);
  }

  final List<Map<DateTime, int>> _heatmapData;
  @override
  @JsonKey()
  List<Map<DateTime, int>> get heatmapData {
    if (_heatmapData is EqualUnmodifiableListView) return _heatmapData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heatmapData);
  }

  @override
  @JsonKey()
  final int selectedYear;
  @override
  @JsonKey()
  final bool loading;
// 新規データ用
  @override
  @JsonKey()
  final String newRecordTitle;
  @override
  @JsonKey()
  final int weight;
  @override
  @JsonKey()
  final int rep;

  @override
  String toString() {
    return 'HomePageState(recordList: $recordList, heatmapData: $heatmapData, selectedYear: $selectedYear, loading: $loading, newRecordTitle: $newRecordTitle, weight: $weight, rep: $rep)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList) &&
            const DeepCollectionEquality()
                .equals(other._heatmapData, _heatmapData) &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.newRecordTitle, newRecordTitle) ||
                other.newRecordTitle == newRecordTitle) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.rep, rep) || other.rep == rep));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recordList),
      const DeepCollectionEquality().hash(_heatmapData),
      selectedYear,
      loading,
      newRecordTitle,
      weight,
      rep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final List<Record> recordList,
      final List<Map<DateTime, int>> heatmapData,
      final int selectedYear,
      final bool loading,
      final String newRecordTitle,
      final int weight,
      final int rep}) = _$_HomePageState;

  @override
  List<Record> get recordList;
  @override
  List<Map<DateTime, int>> get heatmapData;
  @override
  int get selectedYear;
  @override
  bool get loading;
  @override // 新規データ用
  String get newRecordTitle;
  @override
  int get weight;
  @override
  int get rep;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
