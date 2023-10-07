// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_fitness_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyFitnessState {
  List<MyList> get myList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyFitnessStateCopyWith<MyFitnessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFitnessStateCopyWith<$Res> {
  factory $MyFitnessStateCopyWith(
          MyFitnessState value, $Res Function(MyFitnessState) then) =
      _$MyFitnessStateCopyWithImpl<$Res, MyFitnessState>;
  @useResult
  $Res call({List<MyList> myList});
}

/// @nodoc
class _$MyFitnessStateCopyWithImpl<$Res, $Val extends MyFitnessState>
    implements $MyFitnessStateCopyWith<$Res> {
  _$MyFitnessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myList = null,
  }) {
    return _then(_value.copyWith(
      myList: null == myList
          ? _value.myList
          : myList // ignore: cast_nullable_to_non_nullable
              as List<MyList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyFitnessStateCopyWith<$Res>
    implements $MyFitnessStateCopyWith<$Res> {
  factory _$$_MyFitnessStateCopyWith(
          _$_MyFitnessState value, $Res Function(_$_MyFitnessState) then) =
      __$$_MyFitnessStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MyList> myList});
}

/// @nodoc
class __$$_MyFitnessStateCopyWithImpl<$Res>
    extends _$MyFitnessStateCopyWithImpl<$Res, _$_MyFitnessState>
    implements _$$_MyFitnessStateCopyWith<$Res> {
  __$$_MyFitnessStateCopyWithImpl(
      _$_MyFitnessState _value, $Res Function(_$_MyFitnessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myList = null,
  }) {
    return _then(_$_MyFitnessState(
      myList: null == myList
          ? _value._myList
          : myList // ignore: cast_nullable_to_non_nullable
              as List<MyList>,
    ));
  }
}

/// @nodoc

class _$_MyFitnessState implements _MyFitnessState {
  const _$_MyFitnessState({final List<MyList> myList = const []})
      : _myList = myList;

  final List<MyList> _myList;
  @override
  @JsonKey()
  List<MyList> get myList {
    if (_myList is EqualUnmodifiableListView) return _myList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myList);
  }

  @override
  String toString() {
    return 'MyFitnessState(myList: $myList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyFitnessState &&
            const DeepCollectionEquality().equals(other._myList, _myList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_myList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyFitnessStateCopyWith<_$_MyFitnessState> get copyWith =>
      __$$_MyFitnessStateCopyWithImpl<_$_MyFitnessState>(this, _$identity);
}

abstract class _MyFitnessState implements MyFitnessState {
  const factory _MyFitnessState({final List<MyList> myList}) =
      _$_MyFitnessState;

  @override
  List<MyList> get myList;
  @override
  @JsonKey(ignore: true)
  _$$_MyFitnessStateCopyWith<_$_MyFitnessState> get copyWith =>
      throw _privateConstructorUsedError;
}
