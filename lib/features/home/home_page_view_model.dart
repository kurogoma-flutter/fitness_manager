import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/logger/logger.dart';
import '../../core/model/isar/record/record_collection_data_source.dart';
import '../../local/dummy_record_list.dart';
import 'home_page_state.dart';

final homePageViewModelProvider =
    StateNotifierProvider<HomePageViewModel, HomePageState>(
  (ref) => HomePageViewModel(),
);

class HomePageViewModel extends StateNotifier<HomePageState> {
  HomePageViewModel()
      : super(
          const HomePageState(recordList: []),
        );

  final _dataSource = RecordCollectionDataSource();

  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstLaunch') ?? true;
  }

  Future<void> setFirstLaunch() async {
    logger.d('setFirstLaunch');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
  }

  Future<void> fetchRecordList() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(milliseconds: 1500));
    final recordList = await _dataSource.fetchRecordList();
    state = state.copyWith(
      recordList: recordList,
      loading: false,
    );
  }

  Future<void> fetchDummyRecordList() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(milliseconds: 1500));
    final recordList = dummyRecordList;
    state = state.copyWith(
      recordList: [],
      loading: false,
    );
  }

  Future<void> fetchHeatmapData() async {
    final heatmapData = [
      {DateTime(2023, 1, 5): 3},
      {DateTime(2023, 1, 13): 2},
      {DateTime(2023, 1, 22): 4},
      {DateTime(2023, 1, 28): 1},
      {DateTime(2023, 2, 3): 5},
      {DateTime(2023, 2, 7): 3},
      {DateTime(2023, 2, 12): 4},
      {DateTime(2023, 2, 18): 2},
      {DateTime(2023, 2, 25): 3},
      {DateTime(2023, 3, 4): 5},
      {DateTime(2023, 3, 10): 2},
      {DateTime(2023, 3, 15): 1},
      {DateTime(2023, 3, 24): 3},
      {DateTime(2023, 4, 6): 5},
      {DateTime(2023, 4, 14): 1},
      {DateTime(2023, 4, 21): 4},
      {DateTime(2023, 4, 28): 2},
      {DateTime(2023, 5, 2): 3},
      {DateTime(2023, 5, 11): 5},
      {DateTime(2023, 5, 19): 1},
      {DateTime(2023, 5, 26): 4},
      {DateTime(2023, 6, 5): 2},
      {DateTime(2023, 6, 13): 3},
      {DateTime(2023, 6, 22): 5},
      {DateTime(2023, 7, 1): 1},
      {DateTime(2023, 7, 9): 4},
      {DateTime(2023, 7, 17): 2},
      {DateTime(2023, 7, 25): 3},
      {DateTime(2023, 8, 2): 5},
      {DateTime(2023, 8, 8): 1},
      {DateTime(2023, 8, 18): 4},
      {DateTime(2023, 8, 27): 2},
      {DateTime(2023, 9, 4): 5},
      {DateTime(2023, 9, 10): 3},
      {DateTime(2023, 9, 19): 1},
      {DateTime(2023, 9, 28): 2},
      {DateTime(2023, 10, 7): 4},
      {DateTime(2023, 10, 13): 5},
      {DateTime(2023, 10, 20): 1},
      {DateTime(2023, 10, 29): 3},
      {DateTime(2023, 11, 3): 2},
      {DateTime(2023, 11, 12): 5},
      {DateTime(2023, 11, 21): 1},
      {DateTime(2023, 11, 30): 4},
      {DateTime(2023, 12, 5): 3},
      {DateTime(2023, 12, 10): 2},
      {DateTime(2023, 12, 18): 5},
      {DateTime(2023, 12, 27): 1},
      {DateTime(2023, 9, 20): 1},
      {DateTime(2023, 9, 21): 2},
      {DateTime(2023, 9, 22): 3},
      {DateTime(2023, 10, 1): 1},
      {DateTime(2023, 10, 2): 2},
      {DateTime(2023, 10, 3): 3},
      {DateTime(2023, 2, 16): 4},
      {DateTime(2023, 3, 29): 3},
      {DateTime(2023, 6, 30): 2},
      {DateTime(2023, 8, 15): 4},
      {DateTime(2023, 10, 12): 5},
      {DateTime(2023, 11, 15): 3},
    ];

    state = state.copyWith(heatmapData: heatmapData);
  }

  void setTargetYear(int? targetYear) {
    state = state.copyWith(
      selectedYear: targetYear ?? DateTime.now().year,
    );
  }
}
