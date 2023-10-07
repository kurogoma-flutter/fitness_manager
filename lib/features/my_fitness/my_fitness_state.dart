import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/model/isar/mylist/mylist_collection.dart';

part 'my_fitness_state.freezed.dart';

@freezed
class MyFitnessState with _$MyFitnessState {
  const factory MyFitnessState({
    @Default([]) List<MyList> myList,
  }) = _MyFitnessState;
}
