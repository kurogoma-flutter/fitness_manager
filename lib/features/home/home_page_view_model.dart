import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/isar/record/record_collection_data_source.dart';
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
}
