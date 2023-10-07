import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../core/model/isar/mylist/mylist_collection.dart';
import '../../core/model/isar/mylist/mylist_collection_data_source.dart';
import 'my_fitness_state.dart';

final myFitnessViewModelProvider =
    StateNotifierProvider<MyFitnessViewModel, MyFitnessState>(
  (ref) => MyFitnessViewModel(),
);

class MyFitnessViewModel extends StateNotifier<MyFitnessState> {
  MyFitnessViewModel() : super(const MyFitnessState());

  final isarDataSource = MyFitnessCollectionDataSource();

  Future<void> fetchMyFitnessList() async {
    final myFitnessList = await isarDataSource.fetchMyFitnessList();
    state = state.copyWith(myList: myFitnessList);
  }

  Future<void> setMyFitnessData({
    required String url,
  }) async {
    final youtube = YoutubeExplode();
    final videoInfo = await youtube.videos.get(url);
    final myList = MyList()
      ..title = videoInfo.title
      ..thumbnailUrl = videoInfo.thumbnails.standardResUrl
      ..linkUrl = videoInfo.url.toString();

    await isarDataSource.setMyFitnessData(myList: myList);
    await fetchMyFitnessList();
  }
}
