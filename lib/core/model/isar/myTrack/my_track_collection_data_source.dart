import 'package:isar/isar.dart';

import '../isar_instance.dart';
import 'my_track_collection.dart';

class MyTrackCollectionDataSource {
  final isar = IsarInstance().isar;

  // 一覧取得
  Future<List<MyTrack>> fetchMyTrackList() async {
    return isar.myTracks.where().findAll();
  }

  // 追加
  Future<void> setMyTrackData() async {
    // 今日のデータがあるか確認
    final today = DateTime.now();
    final targetData = DateTime(today.year, today.month, today.day);
    final todayData =
        await isar.myTracks.filter().targetDataEqualTo(targetData).findFirst();
    if (todayData == null) {
      // なければ追加
      await isar.writeTxn(() async {
        await isar.myTracks.put(
          MyTrack()
            ..targetData = targetData
            ..count = 1,
        );
      });
    } else {
      // あれば更新
      await isar.writeTxn(() async {
        await isar.myTracks.put(
          MyTrack()
            ..id = todayData.id
            ..targetData = targetData
            ..count = todayData.count + 1,
        );
      });
    }
  }

  /// データの全件削除
  Future<void> deleteAllMyTrackData() async {
    // データ一覧取得
    final myTrackList = await isar.myTracks.where().findAll();
    // idの抽出
    final idList = myTrackList.map((e) => e.id).toList();
    // データ削除
    await isar.writeTxn(() async {
      await isar.myTracks.deleteAll(idList);
    });
  }
}
