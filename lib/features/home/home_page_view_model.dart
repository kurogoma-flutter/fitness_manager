import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/isar/record/record_collection_data_source.dart';
import '../../demo/dummy_record_list.dart';
import 'home_page_state.dart';

final homePageViewModelProvider =
    StateNotifierProvider<HomePageViewModel, HomePageState>(
  (ref) => HomePageViewModel(),
);

class HomePageViewModel extends StateNotifier<HomePageState> {
  HomePageViewModel() : super(const HomePageState());

  final _dataSource = RecordCollectionDataSource();

  Future<void> fetchRecordList() async {
    final recordList = await _dataSource.fetchRecordList();
    state = state.copyWith(recordList: recordList);
  }

  Future<void> fetchDummyRecordList() async {
    debugPrint('fetchDummyRecordList');
    final recordList = dummyRecordList;
    state = state.copyWith(recordList: recordList);
  }
}
