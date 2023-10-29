import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/enum/rm_unit_type.dart';
import '../../core/enum/weight_unit_type.dart';
import '../../core/logger/logger.dart';
import '../../core/model/isar/myTrack/my_track_collection_data_source.dart';
import '../../core/model/isar/record/record_collection.dart';
import '../../core/model/isar/record/record_collection_data_source.dart';
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
  final _myTrackDataSource = MyTrackCollectionDataSource();

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
    try {
      final recordList = await _dataSource.fetchRecordList();
      state = state.copyWith(
        recordList: recordList,
        loading: false,
      );
    } on Exception catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      state = state.copyWith(loading: false);
    }
  }

  Future<void> addNewRecord({
    required String category,
    required double load,
    required WeightUnitType weightUnitType,
    required int time,
    required RmUnitType rmUnitType,
    required String? memo,
  }) async {
    logger.d(memo);

    final now = DateTime.now();
    final record = Record()
      ..category = category
      ..load = load
      ..weightUnitType = weightUnitType
      ..time = time
      ..rmUnitType = rmUnitType
      ..memo = memo
      ..createdAt = now
      ..updatedAt = now;

    await _dataSource.setRecordData(recordModel: record);
    await setMyTrack();
    await fetchHeatmapData();
    await fetchRecordList();
  }

  Future<void> updateRecord({
    required Record targetRecord,
    required String category,
    required double load,
    required WeightUnitType weightUnitType,
    required int time,
    required RmUnitType rmUnitType,
    required String? memo,
  }) async {
    logger.d(memo);
    final now = DateTime.now();
    targetRecord
      ..category = category
      ..load = load
      ..weightUnitType = weightUnitType
      ..time = time
      ..rmUnitType = rmUnitType
      ..updatedAt = now
      ..memo = memo;
    await _dataSource.setRecordData(recordModel: targetRecord);
    await setMyTrack();
    await fetchHeatmapData();
    await fetchRecordList();
  }

  Future<void> fetchHeatmapData() async {
    final heatmapData = await _myTrackDataSource.fetchMyTrackList();

    final mapData = heatmapData.map((e) {
      return {
        DateTime(
          e.targetData.year,
          e.targetData.month,
          e.targetData.day,
        ): e.count,
      };
    }).toList();

    // final heatmapData = [
    //   {DateTime(2023, 1, 5): 3},
    //   {DateTime(2023, 1, 13): 2},
    //   {DateTime(2023, 1, 22): 4},
    //   {DateTime(2023, 1, 28): 1},
    //   {DateTime(2023, 2, 3): 5},
    //   {DateTime(2023, 2, 7): 3},
    //   {DateTime(2023, 2, 12): 4},
    //   {DateTime(2023, 2, 18): 2},
    //   {DateTime(2023, 2, 25): 3},
    //   {DateTime(2023, 3, 4): 5},
    //   {DateTime(2023, 3, 10): 2},
    //   {DateTime(2023, 3, 15): 1},
    //   {DateTime(2023, 3, 24): 3},
    //   {DateTime(2023, 4, 6): 5},
    //   {DateTime(2023, 4, 14): 1},
    //   {DateTime(2023, 4, 21): 4},
    //   {DateTime(2023, 4, 28): 2},
    //   {DateTime(2023, 5, 2): 3},
    //   {DateTime(2023, 5, 11): 5},
    //   {DateTime(2023, 5, 19): 1},
    //   {DateTime(2023, 5, 26): 4},
    //   {DateTime(2023, 6, 5): 2},
    //   {DateTime(2023, 6, 13): 3},
    //   {DateTime(2023, 6, 22): 5},
    //   {DateTime(2023, 7, 1): 1},
    //   {DateTime(2023, 7, 9): 4},
    //   {DateTime(2023, 7, 17): 2},
    //   {DateTime(2023, 7, 25): 3},
    //   {DateTime(2023, 8, 2): 5},
    //   {DateTime(2023, 8, 8): 1},
    //   {DateTime(2023, 8, 18): 4},
    //   {DateTime(2023, 8, 27): 2},
    //   {DateTime(2023, 9, 4): 5},
    //   {DateTime(2023, 9, 10): 3},
    //   {DateTime(2023, 9, 19): 1},
    //   {DateTime(2023, 9, 28): 2},
    //   {DateTime(2023, 10, 7): 4},
    //   {DateTime(2023, 10, 13): 5},
    //   {DateTime(2023, 10, 20): 1},
    //   {DateTime(2023, 10, 29): 3},
    //   {DateTime(2023, 11, 3): 2},
    //   {DateTime(2023, 11, 12): 5},
    //   {DateTime(2023, 11, 21): 1},
    //   {DateTime(2023, 11, 30): 4},
    //   {DateTime(2023, 12, 5): 3},
    //   {DateTime(2023, 12, 10): 2},
    //   {DateTime(2023, 12, 18): 5},
    //   {DateTime(2023, 12, 27): 1},
    //   {DateTime(2023, 9, 20): 1},
    //   {DateTime(2023, 9, 21): 2},
    //   {DateTime(2023, 9, 22): 3},
    //   {DateTime(2023, 10, 1): 1},
    //   {DateTime(2023, 10, 2): 2},
    //   {DateTime(2023, 10, 3): 3},
    //   {DateTime(2023, 2, 16): 4},
    //   {DateTime(2023, 3, 29): 3},
    //   {DateTime(2023, 6, 30): 2},
    //   {DateTime(2023, 8, 15): 4},
    //   {DateTime(2023, 10, 12): 5},
    //   {DateTime(2023, 11, 15): 3},
    // ];

    logger.d(mapData);

    state = state.copyWith(heatmapData: mapData);
  }

  Future<void> setMyTrack() async {
    await _myTrackDataSource.setMyTrackData();
  }

  void setTargetYear(int? targetYear) {
    state = state.copyWith(
      selectedYear: targetYear ?? DateTime.now().year,
    );
  }
}
