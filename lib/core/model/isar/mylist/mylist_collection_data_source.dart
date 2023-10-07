import 'package:isar/isar.dart';

import '../isar_instance.dart';
import 'mylist_collection.dart';

class MyFitnessCollectionDataSource {
  final isar = IsarInstance().isar;

  // 一覧取得
  Future<List<MyList>> fetchMyFitnessList() async {
    return isar.myLists.where().findAll();
  }

  // データ追加 / 更新
  Future<void> setMyFitnessData({
    required MyList myList,
  }) async {
    // データ追加
    await isar.writeTxn(() async {
      await isar.myLists.put(myList);
    });
  }

  // データ削除
  Future<void> deleteMyFitnessData({
    required int id,
  }) async {
    // データ削除
    await isar.writeTxn(() async {
      await isar.myLists.delete(id);
    });
  }
}
